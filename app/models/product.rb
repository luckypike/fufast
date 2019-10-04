class Product < ApplicationRecord
  self.table_name = 'b_catalog_product'

  alias_attribute :id, :ID

  default_scope { includes(:element) }

  has_one :element, foreign_key: 'ID', class_name: 'ProductElement',
    dependent: :destroy, inverse_of: :product

  has_many :product_sections, foreign_key: 'IBLOCK_ELEMENT_ID'
  has_many :sections, through: :product_sections

  has_many :attachments, through: :element
  has_many :element_properties, through: :element

  def title
    element.NAME
  end

  def desc
    element.DETAIL_TEXT
  end

  def image
    "https://fufayka.info/cover/title/#{id}/list.jpg"
  end

  def as_json
    super(only: [], methods: %i[id title attachments image])
  end
end
