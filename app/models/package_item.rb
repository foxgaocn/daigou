class PackageItem < ActiveRecord::Base
  belongs_to :Package
  belongs_to :product
end
