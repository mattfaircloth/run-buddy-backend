class Workout < ApplicationRecord
  has_many :user_workouts
  has_many :users, through: :user_workouts

  def users_in_workout

    users_in_workout = []
    
    self.users.each do |user|
      users_in_workout << user
    end
    users_in_workout
  end
end
