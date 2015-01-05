Fabricator(:user) do
  name    { Faker::Name.first_name }
  email   { Faker::Internet.email }
  avatar  { Faker::Avatar.image(slug = nil, size = '300x300', format = 'jpg')}
  house_id{1}
end

