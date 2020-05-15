class AddAvailableToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :available, :integer, default: 0, nil: false
  end
end
