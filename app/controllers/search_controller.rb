class SearchController < ApplicationController
  before_action :authorize_search

  def index
    respond_to do |format|
      format.html
      format.json do
        @results = Product.all.limit(30)
      end
    end
  end

  private

  def authorize_search
    authorize :search
  end
end
