class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { in: 1..20 }
  validates :last_name, presence: true, length: { in: 1..20 }
  validates :first_name_kana, presence: true, length: { in: 1..20 }
  validates :last_name_kana, presence: true, length: { in: 1..20 }
  validates :user_name, presence: true, uniqueness: true, length: { in: 1..20 }
  validates :phone_number, presence: true
  validates :introduction, length: { maximum: 50 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "ゲスト"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "ゲスト"
      user.user_name = "ゲスト"
      user.phone_number = "ゲスト"
      user.last_sign_in_at = Time.current
    end
  end
  #find_or_create_by!:指定した条件でデータを検索し、存在すればそのデータを返し、存在しなければ新しいデータを作成するメソッド

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # フォローをした、されたの関係
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  #　フォローしたときの処理
  def follow(user_id)
    followers.create(followed_id: user_id)
  end
  #　フォローを外すときの処理
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end
  #フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("user_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("user_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("user_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("user_name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  has_one_attached :user_image

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end
end
