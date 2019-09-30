class Product < ApplicationRecord
  self.table_name = 'b_catalog_product'

  alias_attribute :id, :ID

  default_scope { includes(:element) }

  has_one :element, foreign_key: 'ID', dependent: :destroy, inverse_of: :product

  def title
    element.NAME
  end
end
