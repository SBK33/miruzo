class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :life_status
      t.string :name
      t.text :note
      t.datetime :observed_at
      t.integer :latitude
      t.integer :longitude
      t.boolean :is_private
      t.boolean :is_private_user
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
