# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.find_by(email: "teruki@mail.com").present?
       User.create!(name:  "teruki",
                    email: "teruki@mail.com",
                    password: "1234567",
                    admin: true)
end

5.times do |n|
  User.create(
    name: "test#{n + 1}人目",
    email: "test#{n + 1}@test.com",
    password: "password"
)
end

Shop.create!(
  [
    {name: '珈琲艇キャビン',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kyabin.jpg"),filename: "kyabin.jpg"),
    address: '大阪府大阪市西区南堀江1丁目4-10',
    opneing: '月〜水7:00~18:00 金7:00~18:00 土日9:00~18:00',
    closed: '木曜',
    phone: '06-6535-5850',
    latitude: '34.6693305',
    longitude: '135.4967169',
    user_id: User.find_by(email: "teruki@mail.com", admin: true).id},

    {name: 'サンダー',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sander.jpg"),filename: "sander.jpg"),
    address: '大阪府大阪市大正区三件家西1丁目25-5 シャトー大正',
    opneing: '火~日 8:00~18:00',
    closed: '月曜',
    phone: '06-6555-7727',
    latitude: '34.6644282',
    longitude: '135.4775674',
    user_id: User.find_by(email: "teruki@mail.com", admin: true).id}
  ])

Tag.create!(
  [
    {name: 'コーヒー'},
    {name: '喫煙可'},
    {name: 'ホットサンド'},
    {name: 'チーズケーキ'}
  ])

ShopTag.create!(
  [
    {shop_id: Shop.first.id,tag_id: 1},
    {shop_id: Shop.first.id,tag_id: 2},
    {shop_id: Shop.first.id,tag_id: 3},

    {shop_id: Shop.second.id,tag_id: 1},
    {shop_id: Shop.second.id,tag_id: 2},
    {shop_id: Shop.second.id,tag_id: 4}
  ])
