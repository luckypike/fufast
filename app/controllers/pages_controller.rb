class PagesController < ApplicationController
  before_action :set_sections
  before_action :set_descendants
  before_action :authorize_page

  def index

    @slides = Slide.includes(:attachment).all
  end

  private

  def set_sections
    @sections = Section.where(parent_section: nil).includes(:image)
  end

  def set_descendants
    sections_all = Section.all

    @sections.each do |section|
      section.descendants = section.sections_deep_cache(sections_all)
    end
  end

  def authorize_page
    authorize :page
  end
end
