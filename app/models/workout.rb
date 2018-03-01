class Workout < ApplicationRecord
  has_many :user_workouts
  has_many :users, through: :user_workouts
  belongs_to :owner, class_name: 'User'

  # add owner id to workouts table

  def users_in_workout

    users_in_workout = []

    self.users.each do |user|
      users_in_workout << user
    end
    users_in_workout
  end
end
