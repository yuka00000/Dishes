class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :restaurant_genres
  has_many :genres, through: :restaurant_genres
  has_one_attached :restaurant_image
  validates :name, presence: true, length: { in: 1..20 }
  validates :explanation, presence: true, length: { maximum: 50 }
  validates :price_upper_limit, presence: true
  validates :price_lower_limit, presence: true
  validates :reservation_method, presence: true
  validates :phone_number, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true

  validate :upper_and_lower_check

  enum reservation_method: { internet: 0, phone: 1, reservation_none: 2 }

  def self.price_lower_limit_values
    [ 999 ] + (1..10).map{|i| i * 1000}
  end

  def self.price_upper_limit_values
    [ 999 ] + (2..19).map{|i| i * 1000 - 1} + [ 20000 ]
  end

  def get_restaurant_image(width, height)
    unless restaurant_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      restaurant_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
    end
    restaurant_image.variant(resize_to_limit: [width, height]).processed
  end

  def upper_and_lower_check
    errors.add(:base, "下限価格が上限価格を上回っています。") if price_upper_limit && price_lower_limit && price_upper_limit < price_lower_limit
  end
end
