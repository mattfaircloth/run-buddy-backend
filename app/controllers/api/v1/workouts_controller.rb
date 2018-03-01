class Api::V1::WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def create
    data = params[:data]
    user = User.find_by(email: data[:email])
    workout = Workout.create(workout_params(data))
    # workout.owner = user
    # workout.save
    user_workout = UserWorkout.create(workout: workout, user: user)
    render json: workout
  end

  # only ppl joining a workout should create a user_workout

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy
  end


# Require permit
  private
  def workout_params(data)
    params = {
      start_time: data[:start_time],
      date: data[:date],
      activity: data[:activity],
      address: data[:address],
      latitude: data[:latitude],
      longitude: data[:longitude],
      distance: data[:distance],
      pace: data[:pace]
    }
  end
end
