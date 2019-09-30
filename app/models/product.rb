class Product < ApplicationRecord
  self.table_name = 'b_catalog_product'

  alias_attribute :id, :ID

  default_scope { includes(:element) }

  has_one :element, foreign_key: 'ID', class_name: 'ProductElement',
    dependent: :destroy, inverse_of: :product

  delegate :element_properties, to: :element

  def title
    element.NAME
  end

  def desc
    element.DETAIL_TEXT
  end
end
