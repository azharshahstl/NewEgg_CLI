require "open-uri" 
require "pry" 

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/marketplace/deals?cm_sp=Homepage_MKPL-_--_-09142018"))
    
    doc.css(".promotion-box").each do |product|
      product.css(".itemDescription").text
      binding.pry
    end
  
  end
  
  
end
