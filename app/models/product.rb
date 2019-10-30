class Product < ApplicationRecord
  self.table_name = 'b_catalog_product'

  alias_attribute :id, :ID
  alias_attribute :created_at, :TIMESTAMP_X

  default_scope { includes(:element, :prices) }

  has_one :element, foreign_key: 'ID', class_name: 'ProductElement',
    dependent: :destroy, inverse_of: :product

  has_many :product_sections, foreign_key: 'IBLOCK_ELEMENT_ID'
  has_many :sections, through: :product_sections

  has_many :attachments, through: :element
  has_many :element_properties, through: :element

  has_many :prices, -> { where(currency: :RUB).where.not(value: 0) }, foreign_key: 'PRODUCT_ID', class_name: 'ProductPrice'

  def title
    element.NAME
  end

  def description
    element.DETAIL_TEXT
  end

  def price
    prices.map(&:value).first
  end

  def image
    attachments.min_by(&:id)
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id title price image] }.deep_merge(options || {}))
  end

  class << self
    def orders(product)
      Order.joins(:items)
      .where(b_sale_basket: { product_id: product })
      .map(&:items).flatten
      .map(&:product)
    end

    def buy_with(product, orders)
      Product.where.not(id: product)
        .where(id: orders)
        .limit(6)
    end

    def by_property(property, value)
      joins(:element)
        .joins("INNER JOIN b_iblock_element_property prop_#{property} ON b_iblock_element.ID = prop_#{property}.IBLOCK_ELEMENT_ID")
        .where("prop_#{property}": { IBLOCK_PROPERTY_ID: property, VALUE_ENUM: value })
    end

    def futured(section)
      Product.includes(:attachments).joins(:sections)
        .where(b_iblock_section: { id: section.sections_deep })
        .order(orders_count: :desc)
        .limit(12)
    end

    def deep(section)
      Product.includes(:attachments).joins(:sections)
        .where(b_iblock_section: { id: section.sections_deep })
        .order(created_at: :desc)
    end
  end
end
