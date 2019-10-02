class ProductPropertyEnum < ApplicationRecord
  self.table_name = 'b_iblock_property_enum'

  alias_attribute :id, :ID
  alias_attribute :value, :VALUE
end
