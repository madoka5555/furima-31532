class PurchasesController < ApplicationController

  def index
    @purchase_item = PurchaseItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
    if @purchase_item.valid?
      @purchase_item.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_item_params
    params.require(:purchase_item).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_log_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end