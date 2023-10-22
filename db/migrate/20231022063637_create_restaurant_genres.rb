class CreateRestaurantGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_genres do |t|
      t.references :restaurant
      t.references :genre
      t.timestamps
    end
  end
end
