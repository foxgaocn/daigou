class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :original => "400x520#", :thumb => "100x130#" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
