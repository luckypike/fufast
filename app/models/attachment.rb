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

  def proxy_url(mode, width, height)
    url = Base64.urlsafe_encode64(path).tr('=', '').scan(/.{1,16}/).join('/')

    path = "/#{mode}/#{width}/#{height}/sm/0/#{url}.jpg"

    digest = OpenSSL::Digest.new('sha256')
    hmac = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(digest, IMG_KEY, IMG_SALT + path)).tr('=', '')

    Rails.application.credentials.docker[:host] + hmac + path
  end

  def index
    {
      section: proxy_url(:fit, 1800, 1000),
      slider: proxy_url(:fill, 1600, 800)
    }
  end

  def category
    proxy_url(:fill, 1900, 1000)
  end

  def product
    {
      small: proxy_url(:fit, 750, 750),
      large: proxy_url(:fit, 1000, 1500)
    }
  end

  def as_json(options = nil)
    super({ only: [], methods: %i[id path index product category] }.deep_merge(options || {}))
  end
end
