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
    if properties_params.to_h.size.positive? || @section.sections.empty?
      @products = Product.deep(@section)

      properties_params.each do |property, value|
        @products = @products.by_property(property, value)
      end
    else
      @sections = @section.sections.includes(:sections)
    end
  end

  def properties_params
    permitted = @properties.map(&:id).map(&:to_s)
    permitted += @properties.map(&:id).map { |p| { p.to_s => [] } }
    params.select { |p, _v| @properties.detect { |prop| prop.id == p.to_i } }.permit(*permitted)
  end
end
