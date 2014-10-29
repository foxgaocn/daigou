require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :sku => "Sku",
        :name => "Name",
        :desc => "MyText",
        :category => nil,
        :price => "",
        :stock => 1,
        :active => false,
        :weight => 2
      ),
      Product.create!(
        :sku => "Sku",
        :name => "Name",
        :desc => "MyText",
        :category => nil,
        :price => "",
        :stock => 1,
        :active => false,
        :weight => 2
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
