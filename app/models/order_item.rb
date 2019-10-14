class OrderItem < ApplicationRecord
  self.table_name = 'b_sale_basket'

  alias_attribute :id, :ID
  alias_attribute :order_id, :ORDER_ID

  belongs_to :order, foreign_key: 'ORDER_ID', inverse_of: :items
  belongs_to :product, foreign_key: 'PRODUCT_ID'
end
