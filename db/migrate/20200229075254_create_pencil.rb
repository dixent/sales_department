class CreatePencil < ActiveRecord::Migration[6.0]
  def change
    create_table :pencils do |t|
      t.integer :form, null: false
      t.integer :color, null: false
    end
  end
end
