class Api::V1::WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def create
    data = params[:data]
    workout = Workout.create(workout_params(data))
    render json: workout
  end

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy
  end

  private
  def workout_params(data)
    user = User.find_by(email: data[:email])
    params = {
      start_time: data[:start_time],
      date: data[:date],
      activity: data[:activity],
      address: data[:address],
      latitude: data[:latitude],
      longitude: data[:longitude],
      distance: data[:distance],
      pace: data[:pace],
      user_id: user.id
    }
  end
end
