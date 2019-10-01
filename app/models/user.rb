class User < ApplicationRecord
  self.table_name = 'b_user'

  has_many :orders

  def salt
    self.PASSWORD.slice(0, self.PASSWORD.size - 32)
  end

  def encrypted_password
    self.PASSWORD.slice(-32, 32)
  end

  def valid_password?(password)
    Digest::MD5.hexdigest(salt + password) == encrypted_password
  end
end
