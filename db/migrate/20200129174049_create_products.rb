class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :form
      t.integer :color
      t.integer :kernel
      t.bigint :in_stock
      t.bigint :sold
      t.timestamps
    end
  end
end
