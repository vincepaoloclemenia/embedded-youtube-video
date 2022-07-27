# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.find_or_create_by!(
  title: 'Corolla GRS',
  youtube_id: '_sVfy9XbhfI',
  url: 'https://www.youtube.com/watch?v=_sVfy9XbhfI'
)

ProductControl.find_or_create_by!(
  product: product,
  name: 'SHOP NOW!',
  time_to_showup: 50
)
