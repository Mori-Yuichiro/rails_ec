# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 商品登録用
# 3.times do |i|
#   Item.create!(
#     name: "普通Tシャツ1#{i}",
#     yomi: "ふつうてぃーしゃつ1#{i}",
#     price: 1500,
#     description: "これはTシャツ1#{i}の詳細だ",
#     image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/test1.jpg')),
#                                                   filename: 'test1.jpg')
#   )

#   Item.create!(
#     name: "テストTシャツ2#{i}",
#     yomi: "てすとてぃーしゃつ2#{i}",
#     price: 1800,
#     description: "これはTシャツ1#{i}の詳細だ",
#     image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/test2.jpg')),
#                                                   filename: 'test2.jpg')
#   )

#   Item.create!(
#     name: "変なTシャツ3#{i}",
#     yomi: "へんなてぃーしゃつ3#{i}",
#     price: 2000,
#     description: "これはTシャツ1#{i}の詳細だ",
#     image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/test3.jpg')),
#                                                   filename: 'test3.jpg')
#   )
# end

# 管理者ユーザー登録
3.times do |i|
  User.create!(
    name: "test#{i}",
    password: "password#{i}",
    password_confirmation: "password#{i}"
  )
end
