class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_data, null: false
      t.date :date_of_saling
      t.integer :status, null: false, default: 0
    end
  end
end
