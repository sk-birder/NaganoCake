# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@hoge.com',
  password: 'hogehoge'
)

Customer.create!(
  email: 'customer@hoge.com',
  password: 'hogehoge',
  last_name: '誠也',
  first_name: '鈴木',
  last_name_kana: 'せいや',
  first_name_kana: 'すずき',
  postal_code: '1111111',
  address: 'hoge',
  telephone_number: '11111111111'
)