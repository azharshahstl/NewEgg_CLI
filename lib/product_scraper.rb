require "open-uri" 
require "pry" 

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/marketplace/deals?cm_sp=Homepage_MKPL-_--_-09262018"))
    products_array = []
    doc.css(".promotion-details").each do |product|
      
      product_url = product.css("a").attribute("href").value
      product_name = product.css(".itemDescription").text
      product_price = product.css(".price-current").text.strip.split(" ")[0]
      products_array << {url: product_url, name: product_name, price: product_price}
    end
    products_array
  end
  
  def self.scrape_more_product_info
    doc = Nokogiri::HTML(open("https://www.newegg.com/Product/Product.aspx?Item=9SIA10V5JF7513&ignorebbr=1"))
    doc.css(".item").text.gsub("\r\n", "").gsub("     ", " *")
    
    binding.pry
  end


end
