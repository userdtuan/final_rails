class ChangeFieldsPost < ActiveRecord::Migration[7.0]
  change_column(:posts, :fields, :string)
end
