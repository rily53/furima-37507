class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @buyer_address = BuyerShippingAddress.new
  end

  def create
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
