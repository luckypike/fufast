class ProductsController < ApplicationController
  def show
    @product = Product.includes(:attachments).find(params[:id])
    @section = @product.sections.first

    authorize @product

    respond_to do |format|
      format.html
      format.json do
        @element_properties = @product.element_properties
          .includes(:property).select(&:property)
        @orders = Product.orders(@product)
        @products = Product.buy_with(@product, @orders)
      end
    end
  end
end
