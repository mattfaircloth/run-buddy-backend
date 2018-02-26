class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end
  

  def create
    data = params[:response]
    friends_data = data[:friends][:data]
    arr = friends_data.map{|fr| {name: fr[:name], id: fr[:id]}}
    friends = arr.map{|fr| User.find_by(id: fr[:id])}.compact
    user = User.find_by(id: data[:id])
    if user
      user.update(user_params(data))
    else
      user = User.create(user_params(data))
    end
    user.friends = friends
    if user
      render json: user_with_token(user)
    else
      render json: {error: 'User not found'}, status: 404
    end
  end


  def show
    if current_user
      render json: {
        id: current_user.id,
        name: current_user.name,
        workouts: current_user.workouts,
        email: current_user.email,
        friends: current_user.friends,
        associations: current_user.associations,
        associations_with_workouts: current_user.associations_with_workouts,
        associations_without_workouts: current_user.associations_without_workouts,
        available_workouts: current_user.available_workouts.compact
      }
    else
      render json: {error: 'Error, invalid user!'}, status: 404
    end
  end


  private
  def user_with_token(user)
    payload = {user_id: user.id}
    jwt = issue_token(payload)
    serialized_user = UserSerializer.new(user).attributes
    {currentUser: serialized_user, code: jwt}
  end

  def user_params(data)
    params = {
      id: data[:id],
      name: data[:name],
      email: data[:email],
      profile_image_url: data[:picture][:data][:url]
    }
  end
end
