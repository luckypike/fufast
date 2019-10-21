class AddCacheColumnsToSections < ActiveRecord::Migration[6.0]
  def change
    change_table :b_iblock_section, bulk: true do |t|
      t.column :sections_deep, :json
      t.column :products_count, :integer
    end
  end
end
