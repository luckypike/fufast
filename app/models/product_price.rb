class ProductPrice < ApplicationRecord
  self.table_name = 'b_catalog_price'

  alias_attribute :id, :ID
  alias_attribute :value, :PRICE
  alias_attribute :currency, :CURRENCY

  belongs_to :product, foreign_key: 'PRODUCT_ID'
end
