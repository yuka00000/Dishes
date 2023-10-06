class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.last_name_kana = "ゲスト"
    end
  end
  #find_or_create_by!:指定した条件でデータを検索し、存在すればそのデータを返し、存在しなければ新しいデータを作成するメソッド
end
