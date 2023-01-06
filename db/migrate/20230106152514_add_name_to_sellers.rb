class AddNameToSellers < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :name, :string
  end
end
