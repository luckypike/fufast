class Section < ApplicationRecord
  self.table_name = 'b_iblock_section'

  alias_attribute :id, :ID
  alias_attribute :title, :NAME
  alias_attribute :slug, :CODE
  alias_attribute :active, :ACTIVE
  alias_attribute :iblock_id, :IBLOCK_ID
  alias_attribute :iblock_section_id, :IBLOCK_SECTION_ID

  default_scope { where(iblock_id: 20, active: 'Y') }

  has_many :product_sections, foreign_key: 'IBLOCK_SECTION_ID',
    dependent: :destroy, inverse_of: :section
  has_many :products, through: :product_sections

  has_many :sections, foreign_key: 'IBLOCK_SECTION_ID'

  belongs_to :parent_section, foreign_key: 'IBLOCK_SECTION_ID', class_name: 'Section'
  belongs_to :image, foreign_key: 'PICTURE', class_name: 'Attachment'

  def slug
    self.CODE.downcase
  end

  def siblings
    parent_section ? parent_section.sections : Section.where(parent_section: nil)
  end
end
