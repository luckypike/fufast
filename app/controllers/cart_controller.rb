class CartController < ApplicationController
  before_action :authorize_cart

  def create
    session[:cart] ||= {}

    session[:cart][cart_params[:product_id]] = cart_params[:variants].reject { |i| i['q'] < 1 }

    head :ok
  end

  def index
    @items = []

    if session[:cart]
      session[:cart].each do |product_id, cart|
        product = Product.find_by(id: product_id)
        cart.each do |variant|
          next if variant['q'] < 1

          item = OrderItem.new(product: product, price: product.price, quantity: variant['q'])
          item.size = variant['title']
          @items << item
        end
      end
    end
  end

  def destroy
    session[:cart].delete(params[:id])
  end

  private

  def authorize_cart
    authorize :cart
  end

  def cart_params
    params.require(:cart).permit(:product_id, variants: %i[q title size_id size height height_id])
  end
end
