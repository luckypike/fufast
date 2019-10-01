class OrdersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        @orders = Current.user.orders
      end
    end
  end
end
