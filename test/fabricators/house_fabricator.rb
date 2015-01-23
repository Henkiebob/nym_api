Fabricator(:house) do
  name    {"Test"}
  password { "test" }
  password_confirmation {"test"}
  avatar  { Faker::Avatar.image(slug = nil, size = '300x300', format = 'jpg')}
  #avatar  { Faker::Avatar.image(slug = nil, size = '300x300', format = 'jpg')}
end

