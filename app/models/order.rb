class Order < ApplicationRecord
  self.table_name = 'b_sale_order'

  alias_attribute :id, :ID
  alias_attribute :price, :PRICE
  alias_attribute :currency, :CURRENCY
  alias_attribute :user_id, :USER_ID

  belongs_to :user, foreign_key: 'USER_ID', inverse_of: :orders

  validates :price, presence: true

  accepts_nested_attributes_for :user

  before_validation :set_price
  before_create :set_default

  private

  def set_price
    self.price = 999
    self.currency = :RUB
  end

  def set_default
    self.LID = :s1
    self.PERSON_TYPE_ID = 1
    self.STATUS_ID = :N
    self.DATE_STATUS = Time.current
    self.DATE_INSERT = Time.current
    self.DATE_UPDATE = Time.current
  end
end
