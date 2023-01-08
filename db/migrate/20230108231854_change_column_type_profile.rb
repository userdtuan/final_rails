class ChangeColumnTypeProfile < ActiveRecord::Migration[7.0]
  change_column(:profiles, :working_field, :string)
end
