class ShippingAddress < ApplicationRecord
  belongs_to :buyer

  validates :post_code, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :building_name
  validates :phone, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

end
