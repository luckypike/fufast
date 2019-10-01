class Attachment < ApplicationRecord
  self.table_name = 'b_file'

  alias_attribute :subdir, :SUBDIR
  alias_attribute :filename, :FILE_NAME

  include ActionView::Helpers

  def path
    asset_path("/upload/#{subdir}/#{filename}", host: 'https://fufayka.info')
  end
end
