class OrderItemProperty < ApplicationRecord
  self.table_name = 'b_sale_basket_props'

  alias_attribute :id, :ID
  alias_attribute :name, :NAME
  alias_attribute :value, :VALUE
  alias_attribute :code, :CODE

  belongs_to :order_item, foreign_key: 'ID', inverse_of: :order_item_properties
end
