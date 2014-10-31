require 'rails_helper'

describe User do
  describe 'after_create' do
    it 'should create store' do
      user = FactoryGirl.create(:user)
      puts user.store.inspect
      expect(user.store).not_to eql nil
    end
  end

  describe 'generate_store_name' do
    let(:user) { User.new( {email: 'abc@g.com'})}
    subject { user.generate_store_name }

    before { Store.stub(:pluck).and_return(['abc', 'abc1'])}

    it { should eql 'abc11' }
  end
end
