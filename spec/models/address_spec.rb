require 'rails_helper'

RSpec.describe Address, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :street }
  it { should validate_presence_of :post_code }
  it { should validate_presence_of :phone_number }

  it { should allow_value('312000').for(:post_code) }
  it { should allow_value('13811111111').for(:phone_number) }
  it { should_not allow_value('123').for(:post_code) }
  it { should_not allow_value('123').for(:phone_number) }


end