class UserWorkoutSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :workout_id

  belongs_to :user
  belongs_to :workout

end
