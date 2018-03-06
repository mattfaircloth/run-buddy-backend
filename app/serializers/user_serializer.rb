class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :profile_image_url

  has_many :workouts, through: :user_workouts
  has_many :friends, class_name: "User", through: :user_friends

end
