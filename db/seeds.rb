require 'faker'

#Create offices
1.times do
  Office.create!(
  name: 'Health office'
  )
end

1.times do
  Office.create!(
  name: 'Education office'
  )
end

1.times do
  Office.create!(
  name: 'Finance office'
  )
end

1.times do
  Office.create!(
  name: 'Legal office'
  )
end

1.times do
  Office.create!(
  name: 'Tech office'
  )
end

# Create vendors
10.times do
  jobs = ["Nutritionist", "Nurse", "Podiatrist", "Gastroenterologist", "Dermatologist"]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    field_of_exp: jobs.sample,
    office_id:    1,
    role:         "vendor"
  )
  user.skip_confirmation!
  user.save!
end

10.times do
  jobs = ["Russian language instructor", "Arabic language instructor", "Spanish language instructor", "French language instructor", "AP Calculus Teacher"]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    field_of_exp: jobs.sample,
    office_id:    2,
    role:         "vendor"
  )
  user.skip_confirmation!
  user.save!
end

10.times do
  jobs = ["Certified Professional Accountant", "Certified Financial Advisor", "Tax Attorney", "Certified Financial Planner", ]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    field_of_exp: jobs.sample,
    office_id:    3,
    role:         "vendor"
  )
  user.skip_confirmation!
  user.save!
end

10.times do
  jobs = ["Tax Attorney", "Attorney-at-law", "Real Estate Attorney"]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    field_of_exp: jobs.sample,
    office_id:    4,
    role:         "vendor"
  )
  user.skip_confirmation!
  user.save!
end

10.times do
  jobs = ["Software engineer", "UX Analyst", "Web developer", "iOS developer"]
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    avatar:       Faker::Avatar.image,
    field_of_exp: jobs.sample,
    office_id:    5,
    role:         "vendor"
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

paco = User.first
paco.skip_reconfirmation!
paco.update_attributes!(
  name:     'paco',
  email:    'palmtreerooskee@gmail.com',
  password: 'helloworld',
  role:     'vendor and customer and admin'
)

francisco = User.second
francisco.skip_reconfirmation!
francisco.update_attributes!(
  name:     'francisco',
  email:    'fjp2106@columbia.edu',
  password: 'helloworld',
  role:     'customer'
)
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Office.count} offices created"
