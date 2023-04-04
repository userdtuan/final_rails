class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description, null: true
      t.string :banner, null: true
      t.float :starting_price, null: true
      t.integer :user_id, null: false
      t.json :fields, null: false
      t.boolean :is_job, null: false, default: false
      t.integer :receiver_id, null: true
      t.timestamps
    end
  end
end
