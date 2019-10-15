class User < ApplicationRecord
  self.table_name = 'b_user'

  alias_attribute :id, :ID
  alias_attribute :login, :LOGIN
  alias_attribute :email, :EMAIL
  alias_attribute :name, :NAME
  alias_attribute :lastname, :LAST_NAME
  alias_attribute :phone, :PERSONAL_PHONE
  alias_attribute :checkword, :CHECKWORD
  alias_attribute :password, :PASSWORD
  alias_attribute :active, :ACTIVE

  has_many :orders, dependent: :destroy, inverse_of: :user

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :phone, presence: true
  validates :login, presence: true

  before_validation :set_login
  before_create :set_default

  def salt
    self.PASSWORD.slice(0, self.PASSWORD.size - 32)
  end

  def encrypted_password
    self.PASSWORD.slice(-32, 32)
  end

  def valid_password?(password)
    Digest::MD5.hexdigest(salt + password) == encrypted_password
  end

  def encrypted_checkword
    self.CHECKWORD.slice(-32, 32)
  end

  def valid_token?(token)
    Digest::MD5.hexdigest(self.CHECKWORD.slice(0, self.CHECKWORD.size - 32) + token) == encrypted_checkword
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id email name lastname phone] }.deep_merge(options || {}))
  end

  private

  def set_login
    self.login = email
  end

  def set_default
    self.PASSWORD = 'QWRR'
    self.DATE_REGISTER = Time.current
    self.LID = :s1
  end
end
