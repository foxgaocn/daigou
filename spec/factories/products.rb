FactoryGirl.define do
  factory :product do
    sku "MyString"
    name "MyString"
    desc "MyText"
    category nil
    price 100
    stock 1
    active false
    weight 1
  end

end
