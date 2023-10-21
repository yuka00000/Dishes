class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :restaurant_image
  validates :name, presence: true
  validates :explanation, presence: true, length: { maximum: 50 }
  validates :price_upper_limit, presence: true
  validates :price_lower_limit, presence: true
  validates :reservation_method, presence: true
  validates :phone_number, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true

  enum reservation_method: { internet: 0, phone: 1, reservation_none: 2 }
  enum genre: { japanese: 0, western: 1, asian: 2, italian: 3, french: 4, chinese: 5, cafe: 6, korean: 7, spainh: 8, mexican: 9, thai: 10, indian:11, indonesian: 12, ethnic: 13, fast_food: 14, pasta: 15, hamburger_steak: 16, pizza: 17, curry: 18, salad: 19, ice_cream: 20, omelette_rice: 21, sushi: 22, yakitori: 23, tonkatu: 24, tenpura: 25, 
healthy: 26, cake: 27, coffee: 28, tea: 29, meat:30 }
  
  def self.price_lower_limit_values
    [ 999 ] + (1..10).map{|i| i * 1000}
  end
  
  def self.price_upper_limit_values
    [ 999 ] + (2..19).map{|i| i * 1000 - 1} + [ 20000 ]
  end
  
  def get_restaurant_image(width, height)
    unless restaurant_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      restaurant_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    restaurant_image.variant(resize_to_limit: [width, height]).processed
  end
end
