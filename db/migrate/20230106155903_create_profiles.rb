class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.string :avatar, null: false
      t.text :bio, null: false
      t.json   :working_field, null: true
      t.boolean :is_seller, null: false, default: false

      t.timestamps
    end
  end
end
