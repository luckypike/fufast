class Section < ApplicationRecord
  self.table_name = 'b_iblock_section'

  alias_attribute :id, :ID
  alias_attribute :title, :NAME
  alias_attribute :description, :DESCRIPTION
  alias_attribute :slug, :CODE
  alias_attribute :depth, :DEPTH_LEVEL
  alias_attribute :active, :ACTIVE
  alias_attribute :iblock_id, :IBLOCK_ID
  alias_attribute :iblock_section_id, :IBLOCK_SECTION_ID

  default_scope { where(iblock_id: 20, active: 'Y').with_props }

  attr_accessor :descendants

  has_many :product_sections, foreign_key: 'IBLOCK_SECTION_ID',
    dependent: :destroy, inverse_of: :section
  has_many :products, through: :product_sections do
    def futured
      limit(8)
    end
  end

  has_many :sections, foreign_key: 'IBLOCK_SECTION_ID'

  belongs_to :parent_section, foreign_key: 'IBLOCK_SECTION_ID', class_name: 'Section'
  belongs_to :image, foreign_key: 'PICTURE', class_name: 'Attachment'

  has_many :section_properties
  has_many :properties, through: :section_properties

  def slug
    self.CODE.downcase
  end

  def siblings
    parent_section ? parent_section.sections : Section.where(parent_section: nil)
  end

  def primary_section
    depth == 1 ? self : parent_section.primary_section
  end

  def secondary_section
    if depth < 2
      nil
    elsif depth == 2
      self
    else
      parent_section.secondary_section
    end
  end

  def gloves?
    id == 168
  end

  def sections_deep
    [id] + sections.map(&:sections_deep).flatten
  end

  def sections_deep_cache(sections_all)
    [id] + sections_all.select { |s| s.iblock_section_id == id }.map { |s| s.sections_deep_cache(sections_all) }.flatten
  end

  def bestsellers
    Product.includes(:attachments)
      .joins(:sections).where(b_iblock_section: { id: descendants })
      .order(orders_count: :desc)
      .limit(11)
      # .joins(:prices).where.not(b_catalog_price: { id: nil })
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id title depth slug] }.deep_merge(options || {}))
  end

  class << self
    def with_props
      joins('INNER JOIN b_uts_iblock_20_section uts ON b_iblock_section.ID = uts.VALUE_ID')
    end
  end
end
