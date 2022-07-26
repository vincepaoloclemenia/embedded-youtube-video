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
  
  def update
    product = Product.find params[:id]
    product.update(product_params)
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
    end
  end

  private

  def product_params
    params
      .require(:product)
      .permit(
        :title,
        :youtube_id,
        product_control_attributes: [
          :active,
          :name,
          :time_to_showup,
          :avatar
        ]
      )
  end
end