class ProductSection < ApplicationRecord
  self.table_name = 'b_iblock_section_element'

  alias_attribute :section_id, :IBLOCK_SECTION_ID
  alias_attribute :product_id, :IBLOCK_ELEMENT_ID

  belongs_to :product,
    foreign_key: 'IBLOCK_ELEMENT_ID', inverse_of: :product_sections
  belongs_to :section,
    foreign_key: 'IBLOCK_SECTION_ID', inverse_of: :product_sections
end
