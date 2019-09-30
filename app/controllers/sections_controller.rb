class SectionsController < ApplicationController
  def show
    @section = Section.find_by!(slug: params[:slug])

    respond_to do |format|
      format.html
      format.json do
        @products = @section.products
      end
    end
  end
end
