class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :productable, polymorphic: true
      t.bigint :in_stock
      t.bigint :sold
    end
  end
end
