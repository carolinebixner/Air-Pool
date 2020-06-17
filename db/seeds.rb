require 'faker'

Pool.destroy_all
User.destroy_all

p "Creating users..."
users = []
5.times do
  user = User.create!(
    email: "#{Faker::Hacker.abbreviation}@gmail.com",
    encrypted_password: Faker::Hacker.ingverb
    )
  users << user
  p user
end

p "Users created!"

# p "Creating 4 pools for each user"
# users.each do |user|
#   n = 1
#   4.times do
#     p "Creating pools for user #{n}"
#     pool = Pool.new(
#       name: Faker::Artist.name,
#       description: Faker::ChuckNorris.fact,
#       capacity: rand(0..100),
#       price: rand(200..1000),
#       has_lifeguard: Faker::Boolean.boolean,
#       children_friendly: Faker::Boolean.boolean,
#       jacuzzi_section: Faker::Boolean.boolean,
#       climatization:Faker::Boolean.boolean,
#       pool_side: Faker::Boolean.boolean,
#       has_floats:Faker::Boolean.boolean,
#       towels_include:Faker::Boolean.boolean,
#       pet_friendly: Faker::Boolean.boolean,
#       salted_water: Faker::Boolean.boolean,
#       includes_bar: Faker::Boolean.boolean,
#       )
#     pool.user_id = user.id
#     p pool
#     n += 1
#   end
# end

