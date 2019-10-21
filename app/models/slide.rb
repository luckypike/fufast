class Slide < ApplicationRecord
  self.table_name = 'b_iblock_element'

  alias_attribute :id, :ID
  alias_attribute :title, :NAME

  default_scope { where(iblock_id: 21) }

  belongs_to :attachment, foreign_key: 'PREVIEW_PICTURE'

  delegate :proxy, to: :attachment

  def as_json
    super(only: [], methods: %i[id title proxy])
  end
end
