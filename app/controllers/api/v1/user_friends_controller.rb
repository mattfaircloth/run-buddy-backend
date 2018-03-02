class Api::V1::UserFriendsController < ApplicationController

  def index
    @user_friends = UserFriend.all
    render json: @user_friends
  end

  def create
    data = params[:data]
    user_friend = UserFriend.create(user_friend_params(data))
    render json: user_friend
  end

  def destroy
    user_friend = UserFriend.find(params[:id])
    user_friend.destroy
  end

  private
  def user_friend_params(data)
    params = {
      user_id: data[:user_id],
      friend_id: data[:friend_id]
    }
  end

end
