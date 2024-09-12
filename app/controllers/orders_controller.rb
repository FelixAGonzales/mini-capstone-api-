class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end


  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantityn],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
      )
      if @order.save
        render :show
      else
        render json: { errors: @order.errors.full_messages }
      end

  end
end
