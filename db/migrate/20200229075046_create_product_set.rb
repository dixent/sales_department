class CreateProductSet < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sets do |t|
      t.references :product
      t.integer :number
      t.timestamps
    end
  end
end
