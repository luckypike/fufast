namespace :migrate do
  desc "TODO"
  task images: :environment do
    ProductElement.includes(:attachments).where.not(DETAIL_PICTURE: nil).each do |p|
      if p.attachments.empty?
        att = p.attachments_properties.build(value: p.DETAIL_PICTURE)
        att.save
      end
    end
  end
end
