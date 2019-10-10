class SectionsController < ApplicationController
  before_action :set_section
  before_action :authorize_section
  before_action :set_sections
  before_action :set_properties
  before_action :set_products_or_sections

  def show
    respond_to :html, :json
  end

  private

  def authorize_section
    authorize @section
  end

  def set_section
    @section = Section.find_by!(slug: params[:slug])
  end

  def set_sections
    @primary_section = @section.primary_section
    @secondary_section =
      if @primary_section.gloves?
        @primary_section
      else
        @section.secondary_section
      end
  end

  def set_properties
    @properties = @section.primary_section.properties
  end

  def set_products_or_sections
    if @section.depth > 2
      @products = @section.products.includes(:attachments).select(:id).distinct

      properties_params.each do |property, value|
        @products = @products.by_property(property, value)
      end
    else
      @sections = @section.sections.includes(products: :attachments)
    end
  end

  def properties_params
    params.select { |p, v| @properties.detect { |prop| prop.id == p.to_i } }
  end
end
