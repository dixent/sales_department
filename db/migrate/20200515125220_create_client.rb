class CreateClient < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :phone
      t.timestamps
    end
  end
end
