class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :date, :activity, :address, :latitude, :longitude, :distance, :pace

  has_many :users, through: :user_workouts

  def user_id
    object.user.id
  end
end
