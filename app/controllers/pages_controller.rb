class PagesController < ApplicationController
  before_action :authorize_page

  def index
    @sections = Section.where(parent_section: nil).includes(:image)
    @slides = Slide.includes(:attachment).all
  end

  private

  def authorize_page
    authorize :page
  end
end
