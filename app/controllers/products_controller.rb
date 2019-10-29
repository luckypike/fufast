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
        @orders = Order.joins(:items).where(b_sale_basket: { product_id: @product }).map(&:items).flatten.map(&:product)
        @products = Product.where.not(id: @product).where(id: [@orders]).limit(6)
      end
    end
  end
end
