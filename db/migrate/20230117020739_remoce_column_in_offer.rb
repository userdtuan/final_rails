class RemoceColumnInOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :price
    remove_column :offers, :comment
  end
end
