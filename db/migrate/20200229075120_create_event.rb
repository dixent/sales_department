class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :subject, polymorphic: true
      t.integer :type
      t.timestamps
    end
  end
end
