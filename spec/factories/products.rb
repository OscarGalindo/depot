FactoryGirl.define do
  factory :product do
    title 'title of product'
    description 'description of product'
    price '0.02'
    image_url 'image.jpg'
  end
  factory :dummy do
    title 'title of product'
    description 'description of product'
    price '0.02'
    image_url 'image.jpag'
  end
end
