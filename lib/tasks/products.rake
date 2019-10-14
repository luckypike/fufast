namespace :products do
  desc "TODO"
  task orders: :environment do
    OrderItem.includes(:product).where.not(order_id: nil).group_by(&:product).each do |product, items|
      if product
        product.update(orders_count: items.size)
      end
    end
  end
end
