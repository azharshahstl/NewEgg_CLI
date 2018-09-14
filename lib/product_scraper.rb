require "open-uri" 
require "pry" 

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/marketplace/deals?cm_sp=Homepage_MKPL-_--_-09142018"))
    
    doc.css(".promotion-details").each do |product|
      product_hash = {}
      product_hash[:url] = product.css("a").attribute("href").value
      product_hash[:name] = product.css(".itemDescription").text
      product_hash[:price] = product.css(".price-current").text
      binding.pry
    end
  
  end
  
  
end
