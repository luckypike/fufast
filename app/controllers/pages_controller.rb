class PagesController < ApplicationController
  before_action :authorize_page

  private

  def authorize_page
    authorize :page
  end
end
