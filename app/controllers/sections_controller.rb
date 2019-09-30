class SectionsController < ApplicationController
  def show
    @section = Section.find_by!(slug: params[:slug])
    @products = @section.products
  end
end
