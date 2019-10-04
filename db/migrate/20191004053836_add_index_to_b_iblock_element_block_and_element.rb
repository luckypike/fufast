class AddIndexToBIblockElementBlockAndElement < ActiveRecord::Migration[6.0]
  def change
    add_index :b_iblock_element, %i[IBLOCK_ID ID]
  end
end
