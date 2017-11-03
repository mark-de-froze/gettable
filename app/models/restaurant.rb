class Restaurant < ApplicationRecord
  has_many :tables

  validates :name, :address, :opened_at, :closed_at, presence: true
  validates :opened_at, :closed_at, date: true
  validates_uniqueness_of :name, scope: :address

  def to_label
    "#{name}"
  end
end
