class ProductProperty < ApplicationRecord
  self.table_name = 'b_iblock_property'

  alias_attribute :id, :ID
  alias_attribute :title, :NAME
  alias_attribute :sort, :SORT
  alias_attribute :active, :ACTIVE
  alias_attribute :type, :PROPERTY_TYPE
  alias_attribute :iblock_id, :IBLOCK_ID

  default_scope { where(iblock_id: 20).includes(:enum).where(active: 'Y') }

  has_many :enum, foreign_key: 'PROPERTY_ID',
    class_name: 'ProductPropertyEnum'
end
