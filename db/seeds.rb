# Create users
10.times do
  User.create!(
    username: Faker::Internet.user_name,
  )
end
users = User.all

# Create lists
80.times do
  users.sample.lists.create!(
    name: Faker::Lorem.sentence,
  )
end

lists = List.all

# Create todo items
350.times do
  lists.sample.items.create!(
    description: Faker::Lorem.sentence,
  )
end
items = Item.all

puts "Created #{users.count} users"
puts "Created #{lists.count} lists"
puts "Created #{items.count} items"
