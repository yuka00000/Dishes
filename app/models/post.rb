class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end
end
