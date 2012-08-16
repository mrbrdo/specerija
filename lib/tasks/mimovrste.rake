  desc "Scrap mimovrste."
  # Usage: rake mimovrste['http://www.mimovrste.com/katalog/480/lcd-tv-sprejemniki']
  task :mimovrste, [:url] => :environment do |t, args|
    require_dependency 'mimovrste_scraper'
    s = MimovrsteScraper.new(args[:url])
    s.get_items.each do |item_data|
      Item.create!(item_data)
    end
  end