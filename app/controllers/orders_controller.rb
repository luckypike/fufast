class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    authorize @order

    if @order.save
      sign_in(@order.user)
      head :ok, location: user_path(@order.user)
    else
      # TODO: refactoring
      render json: @order.errors.to_hash.merge({ email_exists: User.exists?(['LOWER(EMAIL) = ?', @order.user.email.downcase]) && (Current.user && Current.user.email.downcase != @order.user.email.downcase) }), status: :unprocessable_entity
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
