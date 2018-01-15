class Concert < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cost, presence: true, numericality: { greater_than: 0 }
end
