class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :access_token
      t.string :profile_image_url

      t.timestamps
    end
  end
end
