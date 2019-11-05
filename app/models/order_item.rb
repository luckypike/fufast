class OrderItem < ApplicationRecord
  self.table_name = 'b_sale_basket'

  alias_attribute :id, :ID
  alias_attribute :product_id, :PRODUCT_ID
  alias_attribute :order_id, :ORDER_ID
  alias_attribute :price, :PRICE
  alias_attribute :title, :NAME
  alias_attribute :quantity, :QUANTITY
  alias_attribute :user, :FUSER_ID

  attr_accessor :size

  belongs_to :order, foreign_key: 'ORDER_ID', inverse_of: :items
  belongs_to :product, foreign_key: 'PRODUCT_ID'

  before_create :set_default

  has_many :order_item_properties, foreign_key: 'BASKET_ID',
    class_name: 'OrderItemProperty', inverse_of: :order_item

  def uuid
    id.presence || SecureRandom.uuid
  end

  def set_default
    self.LID = :s1
    self.CURRENCY = 'RUB'
    self.DATE_INSERT = Time.current
    self.DATE_UPDATE = Time.current
  end
end
