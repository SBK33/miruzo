class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :life_status
      t.string :name, null: false
      t.text :note
      t.datetime :observed_at, null: false
      t.boolean :is_private
      t.boolean :is_private_user
      t.timestamps
    end
  end
end
