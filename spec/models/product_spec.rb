require 'rails_helper'

describe Product do
  describe 'after_create' do
    it 'should add to store' do
      2.times { FactoryGirl.create(:user)}
      FactoryGirl.create(:product)

      Store.all.each do |s|
        expect(s.products.length).to eql 1
      end

      Product.last.destroy

      Store.all.each do |s|
        expect(s.products.length).to eql 0
      end

    end
  end

end
