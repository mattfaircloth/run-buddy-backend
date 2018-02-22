class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_time, :date, :activity, :address, :latitude, :longitude, :distance, :pace

  belongs_to :user

  def user_id
    object.user.id
  end
end
