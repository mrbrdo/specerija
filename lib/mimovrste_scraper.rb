require 'nokogiri'
require 'open-uri'
require 'pry'

class MimovrsteScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def get_items
    @doc.css(".listBox.boxDisplay li").map do |item|
      {
        title: item.css("h1 em").text,
        remote_photo_url: item.css("h1 img").attr("src").value,
        price: item.css("p em").find { |em|
          em.text =~ /Spletna cena/
        }.parent.css("span big").text.gsub(/[\.,]/, '.' => '', ',' => '.').to_f
      }
    end
  end
end