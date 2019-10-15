class ProductsController < ApplicationController
  def show
    @product = Product.includes(:attachments).find(params[:id])
    @section = @product.sections.first.secondary_section
    @siblings = @section.sections

    authorize @product

    respond_to do |format|
      format.html
      format.json do
        @element_properties = @product.element_properties
          .includes(:property).select(&:property)
      end
    end
  end
end
