# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.first || Product.create!(
  title: 'Corolla GRS',
  youtube_id: '_sVfy9XbhfI',
  url: 'https://www.youtube.com/watch?v=_sVfy9XbhfI')

product_control = ProductControl.create!(
  product: product,
  name: 'Show now!',
  avatar: File.open(File.join(Rails.root,'public', 'corolla.png')))