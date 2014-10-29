class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :medium => "400x600>", :thumb => "100x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
