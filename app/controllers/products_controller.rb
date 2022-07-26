class ProductsController < ApplicationController
  def index
    render json: {
      products: Product.all.map do |prod|
                  { 
                    **prod.attributes.symbolize_keys,
                    path: product_url(prod),
                    control: prod.product_control 
                  }
                end
    }
  end

  def show
    product = Product.find_by_id(params[:id])
    render json: { **product.attributes.symbolize_keys, control: product&.product_control }
  end
end