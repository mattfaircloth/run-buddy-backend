class Api::V1::UserWorkoutsController < ApplicationController

  def index
    @user_workouts = UserWorkout.all
    render json: @user_workouts
  end

  def create
    data = params[:data]
    user_workout = UserWorkout.create(user_workout_params(data))
    render json: user_workout
  end

  def destroy
    user_workout = UserWorkout.find(params[:id])
    user_workout.destroy
  end

  private
  def user_workout_params(data)
    params = {
      user_id: data[:user_id],
      workout_id: data[:workout_id]
    }
  end

end
