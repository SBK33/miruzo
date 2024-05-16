class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :life_status
      t.string :name
      t.text :note
      t.datetime :observed_at
      t.boolean :is_private
      t.boolean :is_private_user
      t.string :address,  null: false, default: ""
      t.float :latitude,null: false, default: 0
      t.float :longitude, null: false, default: 0
      t.timestamps
    end
  end
end
