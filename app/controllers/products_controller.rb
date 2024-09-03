class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  
  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  # def price
  #   @product = Product.find_by(price: params[:price])
  #   render template: "products/show"
  # end
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
      )
      @product.save
      render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    @product.save
    render template: "products/show"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product has been deleted"}
  end

end
