require 'faker'

FactoryGirl.define do
  factory :product do
    title       Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    price       Faker::Commerce.price
    image_url   Faker::Company.logo
  end
end
