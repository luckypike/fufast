class CartController < ApplicationController
  def create
    session[:cart] ||= {}
    session[:cart][params[:product_id]] = params[:variants]

    head :ok
  end

  def index

  end
end
