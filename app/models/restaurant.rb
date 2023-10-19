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
  
#["999円以下"], ["1,000円", "1,000円"], ["2,000円", "2,000円"], ["3,000円", "3,000円"], ["4,000円", "4,000円"], ["5,000円", "5,000円"], ["6,000円", "6,000円"], ["7,000円", "7,000円"], ["8,000円", "8,000円"], ["9,000円", "9,000円"], ["10,000円以上"]], include_blank: "選択して下さい" %>
#                 ～
#                <%= f.select :price_upper_limit, [["999円以下"], ["1,999円", "1,999円"], ["2,999円", "2,999円"], ["3,999円", "3,999円"], ["4,999円", "4,999円"], ["5,999円", "5,999円"], ["6,999円", "6,999円"], ["7,999円", "7,999円"], ["8,999円", "8,999円"], ["9,999円", "9,999円"], ["10,999円", "10,999円"], ["14,999円", "14,999円"], ["20,000円以上"]], include_blank: "選択して下さい" %>
#              </td>
  def self.price_lower_limit_values
    [ 999 ] + (1..10).map{|i| i * 1000}
  end
  
  def self.price_upper_limit_values
    [ 999 ] + (1..19).map{|i| i * 1000 - 1} + [ 20000 ]
  end
  
  def get_restaurant_image(width, height)
    unless restaurant_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      restaurant_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    restaurant_image.variant(resize_to_limit: [width, height]).processed
  end
end
