class AddLngLatToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :lng, :float
    add_column :orders, :lat, :float
  end
end
