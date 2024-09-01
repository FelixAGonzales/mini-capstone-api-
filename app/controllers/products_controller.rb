class ProductsController < ApplicationController
  def test_app
    render json: {message: "hello"}
  end

  def product_one
    @product = Product.find_by(id: 1)
    render template: "products/show"
  end
end
