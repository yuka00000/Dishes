class Genre < ApplicationRecord
  has_many :restaurant_genres
  has_many :restaurants, through: :restaurant_genres
end
