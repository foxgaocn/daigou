require 'ffaker'

FactoryGirl.define do
  factory :product do
    sku {Faker::Name.first_name}
    name {Faker::Name.first_name}
    desc {Faker::Name.first_name}
    category nil
    price Faker.numerify('####')
    stock 1
    active false
    weight Faker.numerify('###')

    after(:create) do |prod|
      FactoryGirl.create(:picture, product_id: prod.id)
    end
  end

end
