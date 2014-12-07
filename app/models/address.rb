class Address < ActiveRecord::Base
  belongs_to :user

  validates :name, :street, :post_code, :phone_number, presence: true

  validates :phone_number, numericality: { only_integer: true }, length: { minimum: 8, maximum: 16 }
  validates :post_code, numericality: { only_integer: true }, length: {is: 6}
end
