# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

onigiri = User.find_or_create_by!(email: "onigiri@example.com") do |user|
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

cat = User.find_or_create_by!(email: "cat@example.com") do |user|
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

chick = User.find_or_create_by!(email: "chick@example.com") do |user|
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

bread = User.find_or_create_by!(email: "bread@example.com") do |user|
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

ladybug = User.find_or_create_by!(email: "ladybug@example.com") do |user|
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

wolf = User.find_or_create_by!(email: "wolf@example.com") do |user|
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

reiwa = Restaurant.find_or_create_by!(email: "reiwa@example.com") do |restaurant|
  restaurant.name = "令和食堂"
  restaurant.explanation = "地元で人気の食堂です！"
  restaurant.price_upper_limit = 4999
  restaurant.price_lower_limit = 1000
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都豊島区池袋1-1-1-1"
  restaurant.opening_time = "11:00"
  restaurant.closing_time = "22:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-reiwa.jpg"), filename:"restaurant-reiwa.jpg")
end

pancake = Restaurant.find_or_create_by!(email: "pancake@example.com") do |restaurant|
  restaurant.name = "幸せパンケーキ"
  restaurant.explanation = "パンケーキが人気のカフェです。"
  restaurant.price_upper_limit = 3999
  restaurant.price_lower_limit = 999
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都千代田区神保町1-1-1-1"
  restaurant.opening_time = "10:00"
  restaurant.closing_time = "17:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-cafe.jpg"), filename:"restaurant-cafe.jpg")
end

chinese = Restaurant.find_or_create_by!(email: "chinese@example.com") do |restaurant|
  restaurant.name = "広東飯点"
  restaurant.explanation = "広東料理の老舗です。"
  restaurant.price_upper_limit = 3999
  restaurant.price_lower_limit = 3000
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "phone"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都台東区浅草橋1-1-1-1"
  restaurant.opening_time = "11:00"
  restaurant.closing_time = "22:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-chainese.jpg"), filename:"restaurant-chainese.jpg")
end

hamburg_steak = Restaurant.find_or_create_by!(email: "hamburg-steak@example.com") do |restaurant|
  restaurant.name = "ハンバーグと米"
  restaurant.explanation = "ハンバーグと卵かけご飯が人気のお店です！"
  restaurant.price_upper_limit = 3999
  restaurant.price_lower_limit = 3000
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都板橋区要町1-1-1-1"
  restaurant.opening_time = "11:30"
  restaurant.closing_time = "21:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-hamburger.jpg"), filename:"restaurant-hamburger.jpg")
end

french_kitchen = Restaurant.find_or_create_by!(email: "french@example.com") do |restaurant|
  restaurant.name = "French Kitchen"
  restaurant.explanation = "フレンチの名店です。"
  restaurant.price_upper_limit = 20000
  restaurant.price_lower_limit = 6000
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都渋谷区道玄坂1-1-1-1"
  restaurant.opening_time = "11:30"
  restaurant.closing_time = "21:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/resutaurant.jpg"), filename:"resutaurant.jpg")
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

reiwa.genres.destroy_all
reiwa.genres << Genre.find_by_name('天ぷら')
reiwa.genres << Genre.find_by_name('和食')
