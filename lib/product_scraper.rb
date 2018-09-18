require "open-uri" 
require "pry" 

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/marketplace/deals?cm_sp=Homepage_MKPL-_--_-09142018"))
    
    doc.css(".promotion-details").each do |product|
      product_hash = {}
      #binding.pry
      product_hash[:url] = product.css("a").attribute("href").value
      product_hash[:name] = product.css(".itemDescription").text
      product_hash[:price] = product.css(".price-current").text.strip.split(" ")[0]
      
      binding.pry
    end
  end
  
  def self.ind_product_info_1 
    doc = Nokogiri::HTML(open("https://www.newegg.com/Product/Product.aspx?Item=9SIAGK17VY6522&ignorebbr=1"))
    ind_product_info = {} 
    ind_product_info[:details] = doc.css(".item").css("li").text.strip.gsub(/\r/," ").gsub(/\n/," ").squeeze
    binding.pry
  end
  
  def self.ind_product_info_2
    doc = Nokogiri::HTML(open("https://www.newegg.com/Product/Product.aspx?Item=9SIADF16UR8486&ignorebbr=1"))
    ind_product_info = {} 
    ind_product_info[:details] = doc.css(".item").css("li").text.strip.gsub(/\r/," ").gsub(/\n/," ").squeeze
    binding.pry
  end
  
  def self.ind_product_info_3
    doc = Nokogiri::HTML(open("ttps://www.newegg.com/Product/Product.aspx?Item=9SIAFH56RH8741&ignorebbr=1"))
    ind_product_info = {} 
    ind_product_info[:details] = doc.css(".item").css("li").text.strip.gsub(/\r/," ").gsub(/\n/," ").squeeze
    binding.pry
  end
  
  
end
