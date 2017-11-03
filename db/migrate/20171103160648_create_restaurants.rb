class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :subway
      t.time :opened_at
      t.time :closed_at

      t.timestamps
    end
  end
end
