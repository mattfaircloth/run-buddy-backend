class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def signup
    @user = User.new(username: params[:username], password: params[:password], name: params[:name], email: params[:email], phone: params[:phone])

    if @user.save
      token = issue_token({ 'user_id': @user.id })
      render json: {user: @user, 'token': token}
    else
      render json: {error: "Invalid Entry"}, status: 401
    end
  end

  def login
    u = User.find_by(username: params[:username])

    # if @user && @user.authenticate(params[:password])
    #   render json: {id: @user.id, username: @user.username, token: encode_token({'user_id': @user.id})}
    if u && u.authenticate(params[:password])
      token = issue_token({ 'user_id': u.id })

      render json: {user: u, 'token': token}
    else
      render json: {error: "Username and password do not match"}, status: 401
    end
  end

  def find_current_user
    u = current_user
    if u
      render json: {user: u}
    else
      render json: {error: 'User Not Found'}, status: 401
    end
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
      friends = current_user.friends.map{|friend| friend.slice(:id, :friends, :name, :email, :phone)}
      # byebug
      render json: {
        id: current_user.id,
        name: current_user.name,
        workouts: current_user.workouts,
        user_workouts: current_user.user_workouts,
        user_friends: current_user.user_friends,
        email: current_user.email,
        friends: friends,
        associations: current_user.associations,
        associations_with_workouts: current_user.associations_with_workouts,
        associations_with_user_workouts: current_user.associations_with_user_workouts,
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
