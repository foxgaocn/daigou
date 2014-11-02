require 'rails_helper'

describe StoreProduct do
  describe 'after_create' do
    it 'should auto price' do
      p = Product.create!({name: 'abc', price: 1200})
      u = User.create!( {email: 'a@b.com', password: '123456'})
      u.store.products << p
      expect(u.store.store_products[0].price).to eql 1320
    end
  end
end