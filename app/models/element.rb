class Element < ApplicationRecord
  self.table_name = 'b_iblock_element'

  alias_attribute :id, :ID

  belongs_to :product, foreign_key: 'ID'
end
