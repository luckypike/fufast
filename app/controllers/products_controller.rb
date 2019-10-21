class ProductsController < ApplicationController
  def show
    @product = Product.includes(:attachments).find(params[:id])
    @section = @product.sections.first.secondary_section
    @current = @product.sections.first
    @siblings = @section.sections
    @gloves = @product.sections.first.primary_section
    @gloves_subs = @gloves.sections

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
