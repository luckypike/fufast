class SectionProperty < ApplicationRecord
  self.table_name = 'b_iblock_section_property'
  self.primary_key = [:section_id, :property_id]

  # alias_attribute :id, :ID
  alias_attribute :section_id, :SECTION_ID
  alias_attribute :property_id, :PROPERTY_ID
  alias_attribute :iblock_id, :IBLOCK_ID

  default_scope { where(iblock_id: 20).includes(:enum) }

  belongs_to :section, foreign_key: 'SECTION_ID'
  belongs_to :property, foreign_key: 'PROPERTY_ID', class_name: 'ProductProperty'
  has_many :enum, foreign_key: 'PROPERTY_ID',
    class_name: 'ProductPropertyEnum'
end
