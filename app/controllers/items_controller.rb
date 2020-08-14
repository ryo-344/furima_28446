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
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shippingorigin_id, :burden_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
