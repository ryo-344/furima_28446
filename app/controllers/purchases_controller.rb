class PurchasesController < ApplicationController
before_action :move_to_sign_in
before_action :move_to_top

  def index
    @item = Item.find_by(id: params[:format])
  end

  def create
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    @item = Item.find_by(id: params[:format])
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.purchase.present?
  end

end
