class PurchasesController < ApplicationController
before_action :move_to_sign_in
before_action :move_to_top, except: [:create]
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Purchase.new(user_id: order_params[:user_id], item_id: order_params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
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
    redirect_to root_path if current_user.id == params[:item_id]
    redirect_to root_path if @item.purchase.present?
  end

  def order_params
    params.permit(:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
