require "open-uri" 
require "pry" 

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/"))
  end
  
  
end
