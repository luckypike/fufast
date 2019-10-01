class Order < ApplicationRecord
  self.table_name = 'b_sale_order'

  belongs_to :user, foreign_key: 'USER_ID'
end
