class PagesController < ApplicationController
  before_action :set_sections
  before_action :authorize_page

  def index
    @slides = Slide.includes(:attachment).all
  end

  private

  def set_sections
    @sections = Section.where(parent_section: nil).includes(:image)
  end

  def authorize_page
    authorize :page
  end
end
