namespace :sections do
  desc 'Cache all sections and products count'
  task cache: :environment do
    Section.find_each do |section|
      sections_deep = section.sections_deep_rebuild
      products_count = Product.joins(:sections)
        .where(b_iblock_section: { id: sections_deep }).size

      section.update(
        sections_deep: sections_deep,
        products_count: products_count
      )
    end
  end
end
