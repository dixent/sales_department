class CreatePen < ActiveRecord::Migration[6.0]
  def change
    create_table :pens do |t|
      t.integer :form, null: false
      t.integer :kernel, null: false
      t.timestamps
    end
  end
end
