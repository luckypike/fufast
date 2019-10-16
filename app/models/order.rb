class Order < ApplicationRecord
  self.table_name = 'b_sale_order'

  alias_attribute :id, :ID
  alias_attribute :price, :PRICE
  alias_attribute :currency, :CURRENCY
  alias_attribute :user_id, :USER_ID
  alias_attribute :created_at, :DATE_INSERT

  belongs_to :user, foreign_key: 'USER_ID', inverse_of: :orders

  has_many :items, foreign_key: 'ORDER_ID',
    class_name: 'OrderItem', inverse_of: :order

  validates :price, presence: true

  accepts_nested_attributes_for :user, update_only: true

  before_validation :set_price, on: :create
  before_create :set_default

  def as_json(options = nil)
    super({ only: [], methods: %i[id price currency] }.deep_merge(options || {}))
  end

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
