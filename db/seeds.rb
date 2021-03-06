# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times do
#   user = User.create([
#     {name: Faker::Name.name},
#     {email: Faker::Internet.email},
#     {house_id: 1},
#     {avatar: Faker::Avatar.image(slug = nil, size = '300x300', format = 'jpg')}
#     ])
# end

5.times  {Fabricate(:user)}
1.times  {Fabricate(:house)}
Apikey.create(house_id: 1)
10.times {Fabricate(:task)}
