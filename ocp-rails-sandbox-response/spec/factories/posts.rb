# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    subject Faker::Lorem.characters(35)
    body Faker::Lorem.characters(2000)
    author_id 1
  end
end
