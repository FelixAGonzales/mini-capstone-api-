class CategoryProductsController < ApplicationController
  def index
    @category_products = CategoryProduct.all
    render :index
  end

  def create
    @category_product = CategoryProduct.new(
      product_id: params[:product_id],
      category_id: params[:category_id],
      )
      if @category_product.save
        render :show
      else
        render json: { errors: @category_product.errors.full_messages }
      end
      # render template: "category_products/show"
  end


  def update
    @category_product = CategoryProduct.find_by(id: params[:id])
    @category_product.product_id = params[:product_id]
    @category_product.category_id = params[:category_id]
    @category_product.save
    render template: "category_products/show"
  end
end