# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

おにぎり = User.find_or_create_by!(email: "onigiri@example.com") do |user|
  user.last_name = "山田"
  user.first_name = "太郎"
  user.last_name_kana = "ヤマダ"
  user.first_name_kana = "タロウ"
  user.user_name = "おにぎり"
  user.phone_number = "00000000000"
  user.introduction = "和食が好きです！"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-onigiri.png"), filename:"user-onigiri.png")
end

三毛猫 = User.find_or_create_by!(email: "cat@example.com") do |user|
  user.last_name = "佐藤"
  user.first_name = "花子"
  user.last_name_kana = "サトウ"
  user.first_name_kana = "ハナコ"
  user.user_name = "三毛猫"
  user.phone_number = "00000000000"
  user.introduction = "カフェが好きです！"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-cat.jpg"), filename:"user-cat.jpg")
end

ひよこ = User.find_or_create_by!(email: "chick@example.com") do |user|
  user.last_name = "田中"
  user.first_name = "昭子"
  user.last_name_kana = "タナカ"
  user.first_name_kana = "アキコ"
  user.user_name = "ひよこ"
  user.phone_number = "00000000000"
  user.introduction = "甘党です"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-chick.png"), filename:"user-chick.png")
end

食パン = User.find_or_create_by!(email: "bread@example.com") do |user|
  user.last_name = "木村"
  user.first_name = "一"
  user.last_name_kana = "キムラ"
  user.first_name_kana = "ハジメ"
  user.user_name = "食パン"
  user.phone_number = "00000000000"
  user.introduction = "ハンバーガーが好きです"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-bread.png"), filename:"user-bread.png")
end

てんとう虫 = User.find_or_create_by!(email: "ladybug@example.com") do |user|
  user.last_name = "渡辺"
  user.first_name = "香織"
  user.last_name_kana = "ワタナベ"
  user.first_name_kana = "カオリ"
  user.user_name = "てんとう虫"
  user.phone_number = "00000000000"
  user.introduction = "焼肉が好きです！"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-ladybug.png"), filename:"user-ladybug.png")
end

オオカミ = User.find_or_create_by!(email: "wolf@example.com") do |user|
  user.last_name = "鈴木"
  user.first_name = "次郎"
  user.last_name_kana = "スズキ"
  user.first_name_kana = "ジロウ"
  user.user_name = "オオカミ"
  user.phone_number = "00000000000"
  user.introduction = "中華が好きです"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-wolf.png"), filename:"user-wolf.png")
end

令和食堂 = Restaurant.find_or_create_by!(email: "reiwa@example.com") do |restaurant|
  restaurant.name = "令和食堂"
  restaurant.explanation = "地元で人気の食堂です！"
  restaurant.price_upper_limit = "1,000"
  restaurant.price_lower_limit = "4,999"
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都豊島区池袋1-1-1-1"
  restaurant.opening_time = "11:00"
  restaurant.closing_time = "22:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-wolf.png"), filename:"user-wolf.png")
end

Genre.destroy_all
Genre.create!([
{name:  "和食"},
{name:  "洋食"},
{name:  "アジア料理"},
{name:  "イタリアン"},
{name:  "フレンチ"},
{name:  "中華"},
{name:  "カフェ"},
{name:  "韓国料理"},
{name:  "スペイン料理"},
{name:  "メキシコ料理"},
{name:  "タイ料理"},
{name:  "インド料理"},
{name:  "インドネシア料理"},
{name:  "民族料理"},
{name:  "ファストフード"},
{name:  "パスタ"},
{name:  "ハンバーガー"},
{name:  "ピザ"},
{name:  "カレー"},
{name:  "サラダ"},
{name:  "アイスクリーム"},
{name:  "オムレツ"},
{name:  "寿司"},
{name:  "焼き鳥"},
{name:  "とんかつ"},
{name:  "天ぷら"},
{name:  "ヘルシー"},
{name:  "ケーキ"},
{name:  "コーヒー"},
{name:  "お茶、紅茶"},
{name:  "肉料理"}
])

令和食堂.genres.destroy_all
令和食堂.genres << Genre.find_by_name('天ぷら')
令和食堂.genres << Genre.find_by_name('和食')
