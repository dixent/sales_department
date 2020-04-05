class AddPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :price, :float, null: false, default: 0
  end
end
