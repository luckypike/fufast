class AddIndexToBIblockSectionElementIblockSectionId < ActiveRecord::Migration[6.0]
  def change
    add_index :b_iblock_section_element, :IBLOCK_SECTION_ID
  end
end
