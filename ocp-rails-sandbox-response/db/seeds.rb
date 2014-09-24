# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(name: 'Bob')
Author.create(name: 'Sara')
Author.create(name: 'Drew')
Author.create(name: 'Zheng')
Author.create(name: 'Lucinda')

100.times do
  Post.create!(subject: Faker::Hacker.ingverb, body: Faker::Lorem.paragraph, author_id: [1,2,3,4,5].sample)
end

1000.times do
  Comment.create!(body: Faker::Lorem.paragraph, post_id: (1..100).to_a.sample)
end