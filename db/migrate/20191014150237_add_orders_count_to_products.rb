class AddOrdersCountToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :b_catalog_product, :orders_count, :integer, default: 0
  end
end
