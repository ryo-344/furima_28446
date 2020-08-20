class PurchasesController < ApplicationController
  before_action :move_to_sign_in
  before_action :move_to_top,
                def index
                  @item = Item.find(params[:item_id])
                end

  def create
    @order = ItemShipping.new(order_params.except(:token))
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def order_params
    @item = Item.find(params[:item_id])
    params.permit(:token, :postcode, :shippingorigin_id, :city, :number, :building, :telephonenumber).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
