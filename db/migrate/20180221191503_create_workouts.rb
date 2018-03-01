class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :start_time
      t.string :date
      t.string :activity
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :distance
      t.string :pace
      t.bigint :owner_id, foreign_key: true

      t.timestamps
    end
  end
end
