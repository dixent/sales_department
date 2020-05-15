class AddClientRefToOrders < ActiveRecord::Migration[6.0]
  def up
    add_reference :orders, :client, null: false, foreign_key: true
    remove_column :orders, :user_data
  end

  def down
    remove_reference :orders, :client
    add_column :orders, :user_data, :string, null: false
  end
end
