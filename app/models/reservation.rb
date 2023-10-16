class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :time, uniqueness: { scope: [:date, :restaurant_id] }
end
