class User < ApplicationRecord
  has_many :user_friends
  has_many :friends, class_name: "User", through: :user_friends
  has_many :workouts

    def associations
      associations = []

      self.friends.each do |friend|
        associations << friend
        friend.friends.each do |friend_of_friend|
          associations << friend_of_friend
        end
      end
      associations.delete_if{|element| element.name == self.name}.uniq!
      associations
    end

    def associations_with_workouts
      self.associations.select{|association| association.workouts}
    end

    def associations_without_workouts
      self.associations.select{|association| !association.workouts}
    end

    def available_workouts
      self.associations.map{|association| association.workouts}
    end

    
end
