# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all
Note.destroy_all

# User
sankara = User.create!(email: 'sankara@metal.com', password: 'starwars')
dami = User.create!(email: 'dami@classical.com', password: 'starwars')

# Band
little_as = Band.create!(name: 'the little \'a\'s')
big_as = Band.create!(name: 'THE BIG \'A\'s')

# Album
gonna  = Album.create!(title: 'Gonna be a big A someday!', band: little_as, year: 2017)
gonna1  = Album.create!(title: 'Gonna be a big B someday!', band: little_as, year: 2016)
gonna2  = Album.create!(title: 'Gonna be a big C someday!', band: big_as, year: 2015)
gonna3  = Album.create!(title: 'Gonna be a big D someday!', band: big_as, year: 2014)
gonna4  = Album.create!(title: 'Gonna be a big E someday!', band: big_as, year: 2013)



# Track
track1 = gonna.tracks.create!(title: 'Why would I make my own bracket method?', ord: 1, lyrics: 'lalalalala')
track2 = gonna.tracks.create!(title: 'I ', ord: 2, lyrics: 'rails rails rrrrails')
track3 = gonna.tracks.create!(title: 'I am ', ord: 3, lyrics: 'rails rails rrrrails rrrrails')
track4 = gonna.tracks.create!(title: 'I am riding ', ord: 4, lyrics: 'rails rails rrrrails rrrrailsrrrrails')
track5 = gonna1.tracks.create!(title: 'I am riding the ', ord: 5, lyrics: 'rails rails rrrrails rrrrailsrrrrailsrrrrails')
track6 = gonna1.tracks.create!(title: 'I am riding the rails ', ord: 6, lyrics: 'rails rails rrrrailsrrrrailsrrrrailsrrrrails')
track7 = gonna1.tracks.create!(title: 'I am riding the rails of ', ord: 7, lyrics: 'rails rails rrrrailsrrrrailsrrrrailsrrrrails')
track8 = gonna1.tracks.create!(title: 'I am riding the rails of majesty', ord: 8, lyrics: 'rails rails rrrrailsrrrrailsrrrrailsrrrrailsrrrrails')
track9 = gonna1.tracks.create!(title: 'I am riding the rails of majesty and you!', ord: 9, lyrics: 'rails rails rrrrailsrrrrailsrrrrailsrrrrailsrrrrailsrrrrailsrrrrails')



# Note
note1 = track1.notes.create!(user: sankara, content: 'It\'s better that way')
note2 = track1.notes.create!(user: dami, content: 'Can you add some spacing here?')