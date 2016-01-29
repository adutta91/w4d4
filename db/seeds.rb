# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new
u.email = "arjundutta91@gmail.com"
u.password = "musicapp"
u.save!

10.times do
  b = Band.new
  b.name = Faker::Hipster.words(2).join(" ")
  b.save!
end

Band.all.each do |band|
  3.times do
    a = Album.new
    a.title = Faker::Hipster.words(3).join(" ")
    a.band_id = band.id
    a.recorded = ["live", "studio"].sample
    a.save!
  end
end

Album.all.each do |album|
  5.times do
    t = Track.new
    t.title = Faker::Hipster.words(5).join(" ")
    t.album_id = album.id
    t.style = ["bonus", "regular"].sample
    t.save!
  end
end

Track.all.each do |track|
  n = Note.new
  n.user_id = User.first.id
  n.track_id = track.id
  n.title = Faker::Lorem.word
  n.text = Faker::Hacker.say_something_smart
  n.save!
end
