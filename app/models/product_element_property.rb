class ProductElementProperty < ApplicationRecord
  self.table_name = 'b_iblock_element_property'

  alias_attribute :id, :ID
  alias_attribute :value, :VALUE
  alias_attribute :property_id, :IBLOCK_PROPERTY_ID

  belongs_to :product_element, foreign_key: 'IBLOCK_ELEMENT_ID'
  belongs_to :property, foreign_key: 'IBLOCK_PROPERTY_ID', class_name: 'ProductProperty'

  belongs_to :attachment, foreign_key: 'VALUE'
end
