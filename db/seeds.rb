# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"kaiguo@kaiguo.cloud", firstname: "kai", lastname: "guo", password: "123123", admin: true)

m = Movie.create(title: "Kubo and the Two Strings (2016)", director: "Travis Knight", \
 runtime_in_minutes: 101, description: "A young boy named Kubo must locate a magical suit of armor worn by his late father in order to defeat a vengeful spirit from the past.
",\
  release_date: "1988-03-10",\
   remote_image_url: "http://ia.media-imdb.com/images/M/MV5BMjA2Mzg2NDMzNl5BMl5BanBnXkFtZTgwMjcwODUzOTE@._V1_UY209_CR0,0,140,209_AL_.jpg")
m.reviews.new(user:User.first, text: "first review", rating_out_of_ten: 5)
m.save

m = Movie.new()
m.remote_image_url = "http://ia.media-imdb.com/images/M/MV5BMjQ2NzYxMDQ2OV5BMl5BanBnXkFtZTgwMDk2MzczOTE@._V1_UX140_CR0,0,140,209_AL_.jpg"
m.title = "Ben-Hur (2016)"
m.director = "Timur Bekmambetov"
m.runtime_in_minutes = 124
m.description = "The epic story of Judah Ben-Hur (Jack Huston), a prince falsely accused of treason by his adopted brother, an officer in the Roman army. After years at sea, Judah returns to his homeland to seek revenge, but finds redemption."
m.release_date = "1988-03-10"
m.save

m = Movie.new()
m.remote_image_url = "http://ia.media-imdb.com/images/M/MV5BNDgyMzU5MTc2Ml5BMl5BanBnXkFtZTgwMTYwNzcxOTE@._V1_UY209_CR0,0,140,209_AL_.jpg"
m.title = "Morris from America (2016)"
m.director = "Chad Hartigan"
m.runtime_in_minutes = 91
m.description = "The romantic and coming-of-age misadventures of a 13-year-old American living in Germany."
m.release_date = "1988-03-10"
m.save

m = Movie.new()
m.remote_image_url = "http://ia.media-imdb.com/images/M/MV5BNzg1NTQ0MjYwNl5BMl5BanBnXkFtZTgwMjk1NjYwOTE@._V1_UY209_CR0,0,140,209_AL_.jpg"
m.title = "Lo and Behold, Reveries of the Connected World (2016)"
m.director = "Werner Herzog"
m.runtime_in_minutes = 98
m.description = "Werner Herzog's exploration of the Internet and the connected world."
m.release_date = "1988-03-10"
m.save

