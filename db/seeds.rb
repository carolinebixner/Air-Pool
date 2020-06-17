require 'faker'

p "Deleting pools..."
Pool.delete_all
p "Deleting users..."
User.delete_all

p "Creating users..."
users = []
2.times do
  user = User.create!(
    email: "#{Faker::Name.first_name}@gmail.com",
    password: Faker::Hacker.ingverb
    )
  users << user
  p user
end

p "Users created!"

photo1 = 'app/assets/images/pool1.jpg'
photo2 = 'app/assets/images/pool2.jpg'
photo3 = 'app/assets/images/pool3.jpg'

p "Creating 4 pools for each user"
n = 1

users.each do |user|
  p "Creating pools for user #{n}"
  cities = ["berlin" ,"amsterdam", "paris", "madrid"]
  booleans = [true, false]
  2.times do
    pool = Pool.new(
      name: Faker::Artist.name,
      description: Faker::ChuckNorris.fact,
      location: cities[n - 1],
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
    pool.photos.attach(io: File.open(photo1), filename: 'pool1.jpg', content_type: 'jpg')
    pool.photos.attach(io: File.open(photo2), filename: 'pool2.jpg', content_type: 'jpg')
    pool.photos.attach(io: File.open(photo3), filename: 'pool3.jpg', content_type: 'jpg')
    pool.save!
  end
  n += 1
end


