class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json do
        @element_properties = @product.element_properties
          .includes(:property).select(&:property)
      end
    end
  end
end
