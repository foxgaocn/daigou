require 'rails_helper'


describe Cart do
  describe '#add_item' do
    subject { cart.add_item(item) }
    let(:cart) { FactoryGirl.create(:cart)}
    let(:item) { CartItem.new({product_id: 1, quantity: 2})}

    context 'when cart already has item' do
      before { cart.cart_items.create({product_id:1, quantity: 3}) }

      it 'should increase the quantity' do
        subject
        expect(cart.cart_items[0].quantity).to eql 5
        expect(cart.cart_items.count).to eql 1
      end
    end

    context 'when cart does not have item' do
      before { cart.cart_items.create({product_id:2, quantity: 3}) }

      it 'should increase the quantity' do
        subject
        expect(cart.cart_items[1].quantity).to eql 2
        expect(cart.cart_items.count).to eql 2
      end
    end

  end
end