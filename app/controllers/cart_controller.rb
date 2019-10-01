class CartController < ApplicationController
  before_action :authorize_cart

  def create
    session[:cart] ||= {}
    session[:cart][params[:product_id]] = params[:variants]

    head :ok
  end

  def index

  end

  private

  def authorize_cart
    authorize :cart
  end
end
