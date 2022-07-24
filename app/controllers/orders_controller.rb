class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if  @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

   def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'  
      )
   end
  
  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order != nil
     redirect_to root_path
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
