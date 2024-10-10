class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
    render :index
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: params[:order_id],
      status: params[:status],
      )
      if @carted_product.save
        render :show
      else
        render json: { errors: @carted_product.errors.full_messages }
      end
  end


  def update
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.user_id = params[:user_id]
    @carted_product.product_id = params[:product_id]
    @carted_product.quantity = params[:quantity]
    @carted_product.order_id = params[:order_id]
    @carted_product.status = params[:status]
    @carted_product.save
    render :show
  end
end
