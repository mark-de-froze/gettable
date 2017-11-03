class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.references :restaurant, foreign_key: true
      t.integer :number_table

      t.timestamps
    end
  end
end
