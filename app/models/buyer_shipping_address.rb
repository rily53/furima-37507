class BuyerShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone, :user_id, :item_id, :buyer_id

  with_options presence: true do
    validates :post_code
    validates :municipalities
    validates :address
    validates :phone
    validates :user_id
    validates :item_id
    validates :buyer_id
  end

  # validates :building_name

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :area

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone: phone, buyer_id: buyer.id)
  end
end