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

  def description
    element.DETAIL_TEXT
  end

  def image
    "https://fufayka.info/cover/title/#{id}/list.jpg"
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id title image] }.deep_merge(options || {}))
  end

  class << self
    def by_property(property, value)
      joins(:element)
        .joins("INNER JOIN b_iblock_element_property prop_#{property} ON b_iblock_element.ID = prop_#{property}.IBLOCK_ELEMENT_ID")
        .where("prop_#{property}": { IBLOCK_PROPERTY_ID: property, VALUE_ENUM: value })
    end
  end
end
