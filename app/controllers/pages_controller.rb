class PagesController < ApplicationController
  before_action :authorize_page

  def index
    @slides = Slide.all
  end

  private

  def authorize_page
    authorize :page
  end
end
