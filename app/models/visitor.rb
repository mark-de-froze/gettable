class Visitor < ApplicationRecord
  belongs_to :reservation

  validates :name, :phone, :number_persons, presence: true
  validates :number_persons, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates_format_of :phone, :with =>  /\+\d[0-9]{9,12}\)*\z/ , :message => "Only phone format (+123456789)"
end
