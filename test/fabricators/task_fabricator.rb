Fabricator(:task) do
  name     { Faker::Lorem.sentence }
  house_id {1}
  deadline {Faker::Date.forward(7)}
end
