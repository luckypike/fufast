class OrderItem < ApplicationRecord
  self.table_name = 'b_sale_basket'

  alias_attribute :id, :ID
  alias_attribute :order_id, :ORDER_ID
  alias_attribute :price, :PRICE
  alias_attribute :title, :NAME
  alias_attribute :quantity, :QUANTITY

  attr_accessor :size

  belongs_to :order, foreign_key: 'ORDER_ID', inverse_of: :items
  belongs_to :product, foreign_key: 'PRODUCT_ID'

  def uuid
    id.presence || SecureRandom.uuid
  end
end
