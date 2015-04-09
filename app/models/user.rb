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
    store_url = "#{ENV['dj_mall_url']}/#{auto_name}"
    qr_code_img = RQRCode::QRCode.new(store_url, size: 6).to_img

    store = self.create_store(name:auto_name)
    store.update_attribute :qr_code, qr_code_img.to_string

    Product.all.each { |p| store.products << p } 
  end

  def auto_name
    return @name if @name
    existing_names = Store.pluck(:name)
    @name = email[0..email.index('@')-1]
    while(existing_names.include?(@name)) do
      @name += '1'
    end 
    @name
  end
end
