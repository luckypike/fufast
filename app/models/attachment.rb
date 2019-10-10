class Attachment < ApplicationRecord
  self.table_name = 'b_file'

  alias_attribute :id, :ID
  alias_attribute :subdir, :SUBDIR
  alias_attribute :filename, :FILE_NAME

  has_one :product_element_property, inverse_of: :attachment

  include ActionView::Helpers

  IMG_KEY = [Rails.application.credentials.docker[:key]].pack('H*')
  IMG_SALT = [Rails.application.credentials.docker[:salt]].pack('H*')

  def path
    asset_path("/upload/#{subdir}/#{filename}", host: 'https://fufayka.info')
  end

  def proxy
    url = Base64.urlsafe_encode64(path).tr('=', '').scan(/.{1,16}/).join('/')

    path = "/fill/1600/2000/sm/0/#{url}.jpg"

    digest = OpenSSL::Digest.new('sha256')
    hmac = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(digest, IMG_KEY, IMG_SALT + path)).tr('=', '')

    Rails.application.credentials.docker[:host] + hmac + path
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id path proxy] }.deep_merge(options || {}))
  end
end
