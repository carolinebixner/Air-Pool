require 'faker'
require 'open-uri'

p "Deleting bookings..."
Booking.delete_all
p "Deleting pools..."
Pool.delete_all
p "Deleting users..."
User.delete_all

p "Creating users..."

  users = []
  caro = User.new(
    name: "Caroline",
    email: "caroline@gmail.com",
    password: "123456",
    )
  caro.avatar.attach(io: URI.open("https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476688/mgit9uumrz4varxfwapu.png"), filename: 'caro.png', content_type: 'png')
  caro.save
  p caro
  users << caro

  alejandro = User.new(
  name: "Alejandro",
  email: "alejandro@gmail.com",
  password: "123456",
  )
  alejandro.avatar.attach(io: URI.open('https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476643/olwc4fgd7wrisv8frjfs.png'), filename: 'jandro.png', content_type: 'png')
  alejandro.save
  p alejandro
  users << alejandro

  pati = User.new(
  name: "Pati",
  email: "pati@gmail.com",
  password: "123456",
  )
  pati.avatar.attach(io: URI.open('https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476715/lekgzefpgeqckfyowypd.png'), filename: 'pati.png', content_type: 'png')
  pati.save
  p pati
  users << pati

  marta = User.new(
  name: "Marta",
  email: "marta@gmail.com",
  password: "123456",
  )
  marta.avatar.attach(io: URI.open('https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476666/l3tzmubtz9vyvlcpstqi.png'), filename: 'marta.png', content_type: 'png')
  marta.save
  p marta
  users << marta

p "Users created!"

p "Creating 2 pools for each user"
n = 1

users.each do |user|
  p "Creating pools for #{user.name}"
  cities = ["berlin" ,"amsterdam", "paris", "madrid"]
  booleans = [true, false]
  2.times do
    pool = Pool.new(
      name: Faker::Artist.name,
      description: Faker::ChuckNorris.fact,
      location: cities.sample(1)[0],
      city: cities.sample(1)[0],
      capacity: rand(0..100),
      price: rand(200..1000),
      has_lifeguard: booleans.sample,
      children_friendly: booleans.sample,
      jacuzzi_section: booleans.sample,
      climatization:booleans.sample,
      pool_side: booleans.sample,
      has_floats:booleans.sample,
      towels_include:booleans.sample,
      pet_friendly: booleans.sample,
      salted_water: booleans.sample,
      includes_bar: booleans.sample,
      )

    pool.user_id = user.id
    pool.photos.attach(io: URI.open("https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476035/5v9p7vt9euxdpi0nzpm3ipgk207a.jpg"), filename: 'pool1.jpg', content_type: 'jpg')
    pool.photos.attach(io: URI.open("https://res.cloudinary.com/dvqgik5mb/image/upload/v1592476033/5shlnnq67hxkq16s8xja1trvjcn8.jpg"), filename: 'pool2.jpg', content_type: 'jpg')
    # pool.photos.attach(io: URI.open("https://res.cloudinary.com/dvqgik5mb/image/upload/v1592410449/d9a68mj881067o8u0voqn4zu2h9f.jpg"), filename: 'pool3.jpg', content_type: 'jpg')
    pool.save!
  end
end


