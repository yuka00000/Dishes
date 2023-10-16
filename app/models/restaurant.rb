class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :restaurant_image

  enum reservation_method: { internet: "internet", phone: "phone", reservation_none: "reservation_none" }
  
  def get_restaurant_image(width, height)
    unless restaurant_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      restaurant_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    restaurant_image.variant(resize_to_limit: [width, height]).processed
  end
end
