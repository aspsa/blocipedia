# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create users
10.times do
    pswd = Faker::Internet.password
    pswd_confirm = pswd.to_s
    
    User.create!(
        email: Faker::Internet.email,
        password: pswd,
        password_confirmation: pswd_confirm,
        confirmed_at: Time.now
    )
end

users = User.all

# Create wikis
100.times do
    Wiki.create!(
        title: Faker::Lorem.word,
        body: Faker::Lorem.paragraph,
        user: users.sample
    )
end

puts "Seeding is finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wiki entries created."