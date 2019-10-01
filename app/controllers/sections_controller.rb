class SectionsController < ApplicationController
  def show
    @section = Section.find_by!(slug: params[:slug])

    authorize @section

    respond_to do |format|
      format.html
      format.json do
        @products = @section.products
      end
    end
  end
end
