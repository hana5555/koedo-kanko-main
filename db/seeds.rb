# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者ログイン情報
Admin.create!(
  email: 'koedo@kawagoe.jp',
  password: 'kkkkkk'
  )

#テストデータ
users = User.create!(
  [
    {email: 'tokimo@example.com', last_name: '川越', first_name: 'ときも', last_name_kana: 'カワゴエ', first_name_kana: 'トキモ', username: 'ときも',
      telephone_number: '07000000000', password: 'tokimo'},
    {email: 'ichiro@example.com', last_name: '川越', first_name: 'いちろう', last_name_kana: 'カワゴエ', first_name_kana: 'イチロウ', username: 'いちろう',
      telephone_number: '08000000000', password: 'ichiro'},
    {email: 'jiro@example.com', last_name: '川越', first_name: 'じろう', last_name_kana: 'カワゴエ', first_name_kana: 'ジロウ', username: 'じろう',
      telephone_number: '09000000000', password: 'jirooo'}
  ]
)

categories = Category.create!(
  [
    {name: '建造物'},
    {name: '神社仏閣'},
    {name: '食べ物'},
    {name: 'お店'},
    {name: 'お土産'},
    {name: 'その他'}
  ]
)

Post.create!(
  [
    {text: 'ずっと気になってた喫茶店にて。店内がレトロでいい感じだった～。ゼリーポンチおいしかった！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post1.cafe.JPG"), filename:"post1.cafe.JPG"),
      category_id: categories[2].id, user_id: users[0].id },
    {text: 'かっこいい手水を発見。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post2.tyouzu.JPEG"), filename:"post2.tyouzu.JPEG"),
      category_id: categories[1].id, user_id: users[1].id },
    {text: '夜の氷川神社、いい。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post3.hikawa.JPEG"), filename:"post3.hikawa.JPEG"),
      category_id: categories[1].id, user_id: users[1].id },
    {text: 'お昼は川越の醤油を使ってるうどん屋さんへ。かきあげが大きくて大満足！！！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post4.udon.JPEG"), filename:"post4.udon.JPEG"),
      category_id: categories[2].id, user_id: users[2].id },
    {text: '風鈴のイメージだったけど、風車だらけであった。この時期限定らしい！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post5.kazaguruma.JPEG"),filename:"post5.kazaguruma.JPEG"),
      category_id: categories[1].id, user_id: users[2].id },
    {text: '鯛を釣った～！藤色かな、かわいい。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post6.mikuji.JPEG"), filename:"post6.mikuji.JPEG"),
      category_id: categories[4].id, user_id: users[0].id }
  ]
)

Message.create!(
  [
    {title: '川越、暑いです。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/message1.tukemono.JPEG"), filename:"message1.tukemono.JPEG"),
      message: '「日本で一番暑い街」と言われるとどこを思い浮かべますか？埼玉県の熊谷市が暑い街として有名ですが、実は、川越が日本で一番暑いと言われているのです。気象庁の気象台やアメダスが配置されていなかったため観測外だったのですが、2021年に川越の方が2～3度高かったと研究結果が発表されました。ということで、とにかく暑いです。。川越に来られる際は水分補給をこまめに行い、休憩をはさみながら観光を楽しんでくださいね！無料の休憩所もございますので、ぜひご利用くださいませ。'},
    {title: 'そのゴミお預かりします。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/message4.dagashi.JPEG"), filename:"message4.dagashi.JPEG"),
      message: '川越の街をきれいに保つために、一部の店舗で食べ歩きで出たゴミをお預かりしています！対象店舗の入り口にポスターが貼ってあるので、店員さんまでお声掛けくださいね。川越に来る方も、川越で働く方も、川越に住む方もみんなが気持ちよく過ごせる街で在りたいです。'},
    {title: 'アートを探せ！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/message3.art.JPEG"), filename:"message3.art.JPEG"),
      message: 'このかわいい動物たち、どこにいるかご存知ですか？観光していると本当に突然、現れるんです。ヒントは菓子屋横丁の近くです。ぜひ探してみてください♪'}
  ]
)