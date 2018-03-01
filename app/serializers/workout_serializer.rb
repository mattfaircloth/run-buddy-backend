class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :start_time, :date, :activity, :address, :latitude, :longitude, :distance, :pace

  has_many :users, through: :user_workouts

  def owner_id
    object.owner_id
  end
end
