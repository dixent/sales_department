class AddReferencesToProductSet < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_sets, :order, null: false
  end
end
