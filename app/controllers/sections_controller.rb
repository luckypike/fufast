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
        @products = @section.products
      end
    end
  end
end
