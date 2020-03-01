class AddAdditionFieldsForEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :value, :integer, null: false
    remove_column :events, :type
    add_column :events, :operation_type, :integer, null: false
  end
end
