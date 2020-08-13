class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category, :status, :shippingorigin, :burden, :days, :price)

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
