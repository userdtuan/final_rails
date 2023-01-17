class ChangeFieldsNullable < ActiveRecord::Migration[7.0]
      change_column_null :posts, :fields, true
end
