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
  user.last_sign_in_at = "2023/10/24 19:28"
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
  user.last_sign_in_at = "2023/10/28 16:55"
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
  user.last_sign_in_at = "2023/10/25 12:28"
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
  user.last_sign_in_at = "2023/10/22 08:15"
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
  user.last_sign_in_at = "2023/10/23 18:17"
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
  user.last_sign_in_at = "2023/10/25 21:00"
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
  restaurant.name = "ひき肉と卵"
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
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-hamburg-steak.jpg"), filename:"restaurant-hamburg-steak.jpg")
end

hamburg_steak2 = Restaurant.find_or_create_by!(email: "hamburg-steak2@example.com") do |restaurant|
  restaurant.name = "炭焼きレストラン"
  restaurant.explanation = "ハンバーグの焼き加減はレアがおすすめです！"
  restaurant.price_upper_limit = 4999
  restaurant.price_lower_limit = 3000
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都新宿区西新宿1-1-1-1"
  restaurant.opening_time = "10:00"
  restaurant.closing_time = "22:30"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-hamburg-steak2.jpg"), filename:"restaurant-hamburg-steak2.jpg")
end

hamburg_steak3 = Restaurant.find_or_create_by!(email: "hamburg-steak3@example.com") do |restaurant|
  restaurant.name = "満腹食堂"
  restaurant.explanation = "満腹になるメニューとコスパの良さが売りです！"
  restaurant.price_upper_limit = 1500
  restaurant.price_lower_limit = 999
  restaurant.hp_url = "https://..."
  restaurant.reservation_method = "internet"
  restaurant.phone_number = "00000000000"
  restaurant.post_code = "0000000"
  restaurant.address = "東京都武蔵野市吉祥寺1-1-1-1"
  restaurant.opening_time = "10:00"
  restaurant.closing_time = "21:00"
  restaurant.password = "password"
  restaurant.restaurant_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/restaurant-hamburg-steak3.jpg"), filename:"restaurant-hamburg-steak3.jpg")
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

admin = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
end

post_hamburg_steak3 = Post.find_or_create_by!(id: 1) do |post|
  post.id = 1
  post.title = "都内の美味しいハンバーグ【第3位】"
  post.body = "第3位は武蔵野市吉祥寺にある「満腹食堂」です。ハンバーグにチキン、ソーセージとボリューム満点！ハンバーグは、ジューシーで美味しく、スープ、サラダ、ご飯のセットで700円とコスパも最高です！"
  post.user = User.find_by(email: 'onigiri@example.com')
  post.restaurant = Restaurant.find_by(name: '満腹食堂')
  post.hashbody = "#東京都" "#吉祥寺" "#グルメ" "#ハンバーグ" "#コスパ" "#大盛り"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-hamburg-steak3.jpg"), filename:"post-hamburg-steak3.jpg")
end

post_hamburg_steak = Post.find_or_create_by!(id: 2) do |post|
  post.id = 2
  post.title = "都内の美味しいハンバーグ【第2位】"
  post.body = "第2位は板橋区要町の「ひき肉と卵」です。ハンバーグは10種類の薬味と食べることができ、新鮮な卵を使った卵かけごはんも絶品です！お昼はかなり並ぶので、早めに行くことをお勧めします。"
  post.user = User.find_by(email: 'onigiri@example.com')
  post.restaurant = Restaurant.find_by(name: 'ひき肉と卵')
  post.hashbody = "#東京都" "#要町" "#グルメ" "#ハンバーグ" "#ひき肉と卵" "卵" "卵かけご飯"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-hamburg-steak.jpg"), filename:"post-hamburg-steak.jpg")
end

post_hamburg_steak2 = Post.find_or_create_by!(id: 3) do |post|
  post.id = 3
  post.title = "都内の美味しいハンバーグ【第1位】"
  post.body = "第1位は新宿区西新宿の「炭焼きレストラン」です。行列必須の大人気店！オニオンソースがよく合うハンバーグです。焼き加減は4段階から選ぶことができます！"
  post.user = User.find_by(email: 'onigiri@example.com')
  post.restaurant = Restaurant.find_by(name: '炭焼きレストラン')
  post.hashbody = "#東京都" "#西新宿" "#グルメ" "#ハンバーグ" "#炭焼きレストラン"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-hamburg-steak2.jpg"), filename:"post-hamburg-steak2.jpg")
end

post_pancake = Post.find_or_create_by!(id: 4) do |post|
  post.id = 4
  post.title = "有名なパンケーキ屋！"
  post.body = "パンケーキが人気のお店に行ってきました！2時間並びましたが、パンケーキは2段になっており、ふわふわで美味しかったです！"
  post.user = User.find_by(email: 'ladybug@example.com')
  post.restaurant = Restaurant.find_by(name: '幸せパンケーキ')
  post.hashbody = "#東京都" "#スイーツ" "#パンケーキ"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-pancake.jpg"), filename:"post-pancake.jpg")
end

post_shortcake = Post.find_or_create_by!(id: 5) do |post|
  post.id = 5
  post.title = "おすすめのショートケーキ"
  post.body = "パンケーキが看板メニューのお店ですが、今回はショートケーキを注文。パンケーキ以外頼んだことがなかったのですが、ショートケーキも美味しかったのでおすすめです！"
  post.user = User.find_by(email: 'wolf@example.com')
  post.restaurant = Restaurant.find_by(name: '幸せパンケーキ')
  post.hashbody = "#神保町" "#東京グルメ" "#ケーキ"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-shortcake.png"), filename:"post-shortcake.png")
end

post_chinese = Post.find_or_create_by!(id: 6) do |post|
  post.id = 6
  post.title = "チャーハンの美味しいお店を紹介！"
  post.body = "浅草にある「広東飯点」に行ってきました！様々な料理を頼みましたが、チャーハンが特に美味しかったです。"
  post.user = User.find_by(email: 'bread@example.com')
  post.restaurant = Restaurant.find_by(name: '広東飯点')
  post.hashbody = "#浅草" "#浅草グルメ" "#チャーハン" "中華"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-friedrice.jpg"), filename:"post-friedrice.jpg")
end

post_reiwa = Post.find_or_create_by!(id: 7) do |post|
  post.id = 7
  post.title = "令和食堂に行ってきました"
  post.body = "令和食堂でミックスフライ定食を注文。コスパも良く店員さんも親切でした！"
  post.user = User.find_by(email: 'chick@example.com')
  post.restaurant = Restaurant.find_by(name: '令和食堂')
  post.hashbody = "#東京" "#フライ" "#揚げ物" "#コスパ"
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post-mixfri.jpg"), filename:"post-mixfri.jpg")
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
{name:  "ハンバーグ"},
{name:  "パスタ"},
{name:  "ハンバーガー"},
{name:  "ピザ"},
{name:  "カレー"},
{name:  "サラダ"},
{name:  "アイスクリーム"},
{name:  "オムレツ"},
{name:  "寿司"},
{name:  "焼き鳥"},
{name:  "ラーメン"},
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
reiwa.genres << Genre.find_by_name('とんかつ')
reiwa.genres << Genre.find_by_name('ラーメン')

pancake.genres.destroy_all
pancake.genres << Genre.find_by_name('カフェ')
pancake.genres << Genre.find_by_name('ケーキ')
pancake.genres << Genre.find_by_name('アイスクリーム')
pancake.genres << Genre.find_by_name('コーヒー')
pancake.genres << Genre.find_by_name('お茶、紅茶')

chinese.genres.destroy_all
chinese.genres << Genre.find_by_name('中華')
chinese.genres << Genre.find_by_name('アジア料理')
chinese.genres << Genre.find_by_name('ラーメン')
chinese.genres << Genre.find_by_name('肉料理')

hamburg_steak.genres.destroy_all
hamburg_steak.genres << Genre.find_by_name('ハンバーグ')
hamburg_steak.genres << Genre.find_by_name('洋食')
hamburg_steak.genres << Genre.find_by_name('肉料理')

hamburg_steak2.genres.destroy_all
hamburg_steak2.genres << Genre.find_by_name('ハンバーグ')
hamburg_steak2.genres << Genre.find_by_name('洋食')
hamburg_steak2.genres << Genre.find_by_name('サラダ')
hamburg_steak2.genres << Genre.find_by_name('肉料理')

hamburg_steak3.genres.destroy_all
hamburg_steak3.genres << Genre.find_by_name('ハンバーグ')
hamburg_steak3.genres << Genre.find_by_name('洋食')
hamburg_steak3.genres << Genre.find_by_name('肉料理')
hamburg_steak3.genres << Genre.find_by_name('パスタ')
hamburg_steak3.genres << Genre.find_by_name('とんかつ')
hamburg_steak3.genres << Genre.find_by_name('カレー')

french_kitchen.genres.destroy_all
french_kitchen.genres << Genre.find_by_name('フレンチ')
french_kitchen.genres << Genre.find_by_name('洋食')
french_kitchen.genres << Genre.find_by_name('肉料理')
french_kitchen.genres << Genre.find_by_name('オムレツ')