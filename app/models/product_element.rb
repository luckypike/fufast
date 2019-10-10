class ProductElement < ApplicationRecord
  self.table_name = 'b_iblock_element'

  alias_attribute :id, :ID
  alias_attribute :iblock_id, :IBLOCK_ID

  default_scope { where(iblock_id: 20) }

  belongs_to :product, foreign_key: 'ID'
  # belongs_to :product_property, foreign_key: 'IBLOCK_PROPERTY_ID'

  has_many :element_properties, foreign_key: 'IBLOCK_ELEMENT_ID',
    class_name: 'ProductElementProperty', inverse_of: :product_element

  has_many :attachments_properties, -> { where(IBLOCK_PROPERTY_ID: 111) }, foreign_key: 'IBLOCK_ELEMENT_ID',
    class_name: 'ProductElementProperty'

  has_many :attachments, through: :attachments_properties
end
