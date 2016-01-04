require 'faker'

# Create vendors



30.times do
  jobs = ["Certified Professional Accountant", "Certified Financial Advisor", "Nutritionist", "Nurse", "Podiatrist", "Tax Attorney", "Attorney-at-law", "Russian language instructor", "Arabic language instructor", "Spanish language instructor", "French language instructor", "AP Calculus Teacher", "Software engineer", "UX Analyst", "Web developer", "iOS developer"]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    vendor:       true,
    client:       false,
    field_of_exp: jobs.sample
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.

 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.

 # The `save` method then saves this User to the database.

# Create menu
1.times do
  Menu.create!(
  name: 'Menu'
  )
end

#Create offices
1.times do
  Office.create!(
  name: 'Health office',
  menu: Menu.first
  )
end

1.times do
  Office.create!(
  name: 'Education office',
  menu: Menu.first
  )
end

1.times do
  Office.create!(
  name: 'Finance office',
  menu: Menu.first
  )
end

1.times do
  Office.create!(
  name: 'Legal office',
  menu: Menu.first
  )
end

1.times do
  Office.create!(
  name: 'Tech office',
  menu: Menu.first
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  name:     'paco',
  email:    'palmtreerooskee@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Menu.count} menus created"
puts "#{Office.count} offices created"
