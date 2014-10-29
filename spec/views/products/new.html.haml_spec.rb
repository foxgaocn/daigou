require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :sku => "MyString",
      :name => "MyString",
      :desc => "MyText",
      :category => nil,
      :price => "",
      :stock => 1,
      :active => false,
      :weight => 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_sku[name=?]", "product[sku]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_desc[name=?]", "product[desc]"

      assert_select "input#product_category_id[name=?]", "product[category_id]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_stock[name=?]", "product[stock]"

      assert_select "input#product_active[name=?]", "product[active]"

      assert_select "input#product_weight[name=?]", "product[weight]"
    end
  end
end
