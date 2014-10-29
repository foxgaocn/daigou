class Product < ActiveRecord::Base
  belongs_to :category

  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures, :reject_if => proc {|attributes|
    attributes.all? {|k,v| v.blank?}
  }, :allow_destroy => true
end
