require 'faker'

p "Deleting pools..."
Pool.delete_all
p "Deleting users..."
User.delete_all

p "Creating users..."
users = []
5.times do
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
  4.times do
    pool = Pool.new(
      name: Faker::Artist.name,
      description: Faker::ChuckNorris.fact,
      location: Faker::Address.full_address,
      capacity: rand(0..100),
      price: rand(200..1000),
      has_lifeguard: Faker::Boolean.boolean,
      children_friendly: Faker::Boolean.boolean,
      jacuzzi_section: Faker::Boolean.boolean,
      climatization:Faker::Boolean.boolean,
      pool_side: Faker::Boolean.boolean,
      has_floats:Faker::Boolean.boolean,
      towels_include:Faker::Boolean.boolean,
      pet_friendly: Faker::Boolean.boolean,
      salted_water: Faker::Boolean.boolean,
      includes_bar: Faker::Boolean.boolean,
      )
    pool.user_id = user.id
    pool.photos.attach(io: File.open(photo1), filename: 'pool1.jpg', content_type: 'jpg')
    pool.photos.attach(io: File.open(photo2), filename: 'pool2.jpg', content_type: 'jpg')
    pool.photos.attach(io: File.open(photo3), filename: 'pool3.jpg', content_type: 'jpg')
    pool.save!
  end
  n += 1
end

