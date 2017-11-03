class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.references :reservation, foreign_key: true
      t.string :name
      t.string :phone
      t.text :note
      t.integer :number_persons

      t.timestamps
    end
  end
end
