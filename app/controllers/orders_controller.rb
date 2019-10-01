class OrdersController < ApplicationController
  def index
    authorize Order

    respond_to do |format|
      format.html
      format.json do
        @orders = Current.user.orders
      end
    end
  end

  def create
    @order = Order.new(order_params)

    authorize @order

    if @order.save
      sign_in(@order.user)
      head :ok, location: orders_path
    else
      render json: @order.errors.to_hash.merge({ email_exists: User.exists?(['LOWER(EMAIL) = ?', @order.user.email.downcase]) }), status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :user_id,
      user_attributes: %i[name lastname email phone]
    )
  end
end
