class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations

  validates :get_post_image, presence: true, blob: { content_type: :image }
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  after_create do
    post = Post.find_by(id: id)
    # hashbodyに打ち込まれたハッシュタグを検出
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の#を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
  #更新アクション
  before_update do
    post = Post.find_by(id: id)
    #postに関連付けられたすべてのハッシュタグを削除
    post.hashtags.clear
    #hashbodyから正規表現にマッチするハッシュタグを取得
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #重複したハッシュタグを取り除き、ユニークなハッシュタグのリストを作成
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#')) #取得したハッシュタグを元に、既存のハッシュタグを検索し、存在しない場合は新しく作成。ハッシュタグの大文字小文字を区別しないように、downcaseで小文字に変換す。
      post.hashtags << tag #更新前のpostに新しいハッシュタグを関連付ける
    end
  end

  def get_post_image
    post_image
  end
end
