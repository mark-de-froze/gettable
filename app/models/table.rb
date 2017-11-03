class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations

  validates_uniqueness_of :number_table, scope: :restaurant_id, message: "The restaurant has a table with this number"
  validates :number_table, numericality: { only_integer: true }

  def to_label
    "Table ##{number_table}"
  end
end
