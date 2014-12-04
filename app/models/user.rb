class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :store,  dependent: :destroy

  has_many :orders
  has_many :addresses
  
  after_create :create_the_store


  def create_the_store
    name = generate_store_name
    store_url = "#{ENV['dj_mall_url']}/#{name}"
    qr_code_img = RQRCode::QRCode.new(store_url).to_img

    store = self.create_store(name:name)
    store.update_attribute :qr_code, qr_code_img.to_string

    Product.all.each { |p| store.products << p } 
  end

  def generate_store_name
    existing_names = Store.pluck(:name)
    name = email[0..email.index('@')-1]
    while(existing_names.include?(name)) do
      name += '1'
    end 
    name
  end
end
