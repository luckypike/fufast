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
          @products = @section.products
        else
          @sections = @section.sections.includes(:products)
        end
      end
    end
  end
end
