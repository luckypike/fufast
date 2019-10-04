class SectionsController < ApplicationController
  def show
    @section = Section.find_by!(slug: params[:slug])

    authorize @section

    respond_to do |format|
      format.html
      format.json do
        @primary_section = @section.primary_section
        @secondary_section = @section.secondary_section
        @subs = (@secondary_section || @primary_section).sections

        if @section.depth > 2
          @products = @section.products.select(:id)
            # .joins(:element_properties)
            # .where(b_iblock_element_property: { IBLOCK_PROPERTY_ID: 108, VALUE: ['65'] })
            # .where(b_iblock_element_property: { IBLOCK_PROPERTY_ID: 101, VALUE: [10] })
            # .where(b_iblock_element_property: { IBLOCK_PROPERTY_ID: 101, VALUE: [11, 149] })
        else
          @sections = @section.sections.includes(:products)
        end
      end
    end
  end
end
