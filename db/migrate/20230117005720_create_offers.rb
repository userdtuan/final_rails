class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :post_id, null: false
      t.float :price, null: false, default: false
      t.text :comment, null: true
      t.string :status, null: false, default: "waiting"

      t.timestamps
    end
  end
end
