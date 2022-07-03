class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @items.user_id != current_user.id
  end

  def update
    if @items.update(item_params)
      redirect_to item_path(@items.id)
    else
      render :edit
    end
  end

  def destroy
    if @items.user_id == current_user.id
      @items.destroy
    end
    redirect_to root_path
  end

  private

  def set_item
    @items = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
