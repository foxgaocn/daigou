require 'rails_helper'


describe Packing do
  describe '#pack_order' do
    subject { Packing.new.pack_order(order)}
    let(:order) {Order.create(user_id: 1)}
    let(:product) { FactoryGirl.create(:product) }
    let(:product_200) { FactoryGirl.create(:product, weight: 200)}
    let(:product_300) { FactoryGirl.create(:product, weight: 300)}
    let(:product_4400) { FactoryGirl.create(:product, weight: 4400)}


    context 'when order only has one item' do
      
      before { order.order_items.create(product_id: product.id, quantity: 1) }

      it 'should put the product in one package' do
        subject
        expect(order.packages.count).to eql 1
        expect(order.packages[0].package_items[0].product_id).to eql product.id
        expect(order.packages[0].package_items[0].quantity).to eql 1
      end
    end

    context 'when order has 23 item with weight 200' do
      before { order.order_items.create(product_id: product_200.id, quantity: 23) }

      it 'should pack 22 item in the first package' do
        subject
        expect(order.packages[0].package_items[0].product_id).to eql product_200.id
        expect(order.packages[0].package_items[0].quantity).to eql 22
      end

      it 'should pack 1 item in the second package' do
        subject
        expect(order.packages[1].package_items[0].product_id).to eql product_200.id
        expect(order.packages[1].package_items[0].quantity).to eql 1
      end
    end

    context 'when order has 1 200g item, 1 4400g item and 2 300 item' do
      before do
        order.order_items.create(product_id: product_200.id, quantity: 1)
        order.order_items.create(product_id: product_4400.id, quantity: 1)
        order.order_items.create(product_id: product_300.id, quantity: 2)
      end

      it 'should pack correctly' do
        subject
        expect(order.packages[0].package_items[0].product_id).to eql product_200.id
        expect(order.packages[0].package_items[0].quantity).to eql 1
        expect(order.packages[0].package_items[1].product_id).to eql product_300.id
        expect(order.packages[0].package_items[1].quantity).to eql 2
        expect(order.packages[1].package_items[0].product_id).to eql product_4400.id
        expect(order.packages[1].package_items[0].quantity).to eql 1
      end
    end

    context 'when order has multiple items' do
      before do
        order.order_items.create(product_id: product_2600.id, quantity: 5)
        order.order_items.create(product_id: product_200.id, quantity: 5)
        order.order_items.create(product_id: product_300.id, quantity: 5)
      end

      it 'should pack correctly' do
        subject
        expect(order.packages[0].package_items[0].product_id).to eql product_200.id
        expect(order.packages[0].package_items[0].quantity).to eql 1
        expect(order.packages[0].package_items[1].product_id).to eql product_300.id
        expect(order.packages[0].package_items[1].quantity).to eql 2
        expect(order.packages[1].package_items[0].product_id).to eql product_4400.id
        expect(order.packages[1].package_items[0].quantity).to eql 1
      end
    end

  end
end