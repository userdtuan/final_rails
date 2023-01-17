class AddColumnInOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :seller_id, :integer
  end
end
