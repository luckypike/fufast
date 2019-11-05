class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

    authorize @order
  end

  def create
    @order = Order.new(order_params)
    authorize @order

    session[:cart].each do |product_id, cart|
      product = Product.find_by(id: product_id)

      cart.each do |variant|
        next if variant['q'] < 1

        item = OrderItem.new(product: product, user: @order.user.id, price: product.price, quantity: variant['q'], title: product.title)

        prop_enum = ProductPropertyEnum.find(variant['size'])
        prop = ProductProperty.find(variant['size_id'])
        item.order_item_properties << OrderItemProperty.new(name: prop.title, value: prop_enum.value, code: prop.code)

        if variant['height']
          prop_enum = ProductPropertyEnum.find(variant['height'])
          prop = ProductProperty.find(variant['height_id'])
          item.order_item_properties << OrderItemProperty.new(name: prop.title, value: prop_enum.value, code: prop.code)
        end

        @order.items << item
      end
    end

    if @order.save!
      session.delete(:cart)
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
