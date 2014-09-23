# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.characters(500)
    post_id 1
  end
end
