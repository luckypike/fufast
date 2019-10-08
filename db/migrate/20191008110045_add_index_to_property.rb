class AddIndexToProperty < ActiveRecord::Migration[6.0]
  def change
    add_index :b_iblock_element_property, %i[IBLOCK_ELEMENT_ID]
  end
end
