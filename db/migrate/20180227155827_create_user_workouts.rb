class CreateUserWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_workouts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :workout, foreign_key: true
    end
  end
end
