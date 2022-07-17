class OrdersController < ApplicationController
  def index
    @order_address = orderAddress.new
  end

  def create
  end

end
