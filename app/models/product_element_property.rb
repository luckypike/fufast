class ProductElementProperty < ApplicationRecord
  self.table_name = 'b_iblock_element_property'

  alias_attribute :id, :ID
  alias_attribute :value, :VALUE

  belongs_to :product_element, foreign_key: 'IBLOCK_ELEMENT_ID'
  belongs_to :property, foreign_key: 'IBLOCK_PROPERTY_ID', class_name: 'ProductProperty'

  # def title
  #   product_property.title
  # end
end
