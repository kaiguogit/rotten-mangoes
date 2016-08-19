# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"kaiguo@kaiguo.cloud", firstname: "kai", lastname: "guo", password: "123123", admin: true)
m = Movie.create(title: "test movie", director: "asdf", runtime_in_minutes: 150, description: "some description", release_date: "1988-03-10", image: "001-3d.png", poster_image_url: "asdf")
m.reviews.new(user:User.first, text: "first review", rating_out_of_ten: 5)
m.save

m = Movie.create(title: "test movie", director: "asdf", \
 runtime_in_minutes: 150, description: "some description",\
  release_date: "1988-03-10", image: "001-3d.png",\
   poster_image_url: "http://ia.media-imdb.com/images/M/MV5BMjA2Mzg2NDMzNl5BMl5BanBnXkFtZTgwMjcwODUzOTE@._V1_UY209_CR0,0,140,209_AL_.jpg")
m.reviews.new(user:User.first, text: "first review", rating_out_of_ten: 5)
m.save


