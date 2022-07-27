class PagesController < ApplicationController

  def home
    @product = Product.first
  end

  def edit_video
    @product = Product.first

    redirect_to root_path if @product.nil? and return
  end
end