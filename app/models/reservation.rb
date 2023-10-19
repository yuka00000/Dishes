class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :date, presence: true
  validates :time, presence: true, uniqueness: { scope: [:date, :restaurant_id] }
  validates :people_count, presence: true
end
