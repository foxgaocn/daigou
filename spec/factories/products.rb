require 'ffaker'

FactoryGirl.define do
  factory :product do
    sku {FFaker::Name.first_name}
    name {FFaker::Name.first_name}
    desc {FFaker::Name.first_name}
    category nil
    price FFaker.numerify('####')
    stock 1
    active false
    weight FFaker.numerify('###')

    after(:create) do |prod|
      FactoryGirl.create(:picture, product_id: prod.id)
    end
  end

end
