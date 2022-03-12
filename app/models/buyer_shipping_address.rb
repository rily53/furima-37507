class BuyerShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone, length: { is: 11, message: 'is too short' }
    validates :user_id
    validates :item_id
  end

    validates :phone, format: { with: /\d{10,11}/, message: 'is invalid. Input only number' }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone: phone, buyer_id: buyer.id)
  end
end