class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end


  def create

    product = Product.find_by(id: params[:product_id])
    calculated_subtotals = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotals * 0.09
    calculated_total = calculated_subtotals + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotals,
      tax: calculated_tax,
      total: calculated_total,
      )
      if @order.save
        render :show
      else
        render json: { errors: @order.errors.full_messages }
      end

  end
end
