

class Scraper 
  
  def self.scrape_eggxtra_hot_deals 
    doc = Nokogiri::HTML(open("https://www.newegg.com/marketplace/deals?cm_sp=Homepage_MKPL-_--_-10102018"))
    
    products_array = []
    
    doc.css(".promotion-details").each do |product|
      product_url = product.css("a").attribute("href").value
      product_name = product.css(".itemDescription").text
      product_price = product.css(".price-current").text.strip.split(" ")[0]
      products_array << {url: product_url, name: product_name, price: product_price}
      #binding.pry
    end
    products_array
  end
  
  def self.scrape_more_product_info(product)
    
    doc = Nokogiri::HTML(open(product.url))
    
    #check line 25 and look at its children.  Should not need all the gsubs.
    product.info = doc.css(".item").text.strip.gsub("\r\n       ", "").gsub("          ", "").gsub("      ", "")
    product.shipping_info = doc.css(".grpNote-ship").text.strip.gsub("\r\n       ", "").gsub("          ", "").gsub("      ", "")
    product.sold_by_info = doc.css(".grpNote-sold-by").text.strip.gsub("\r\n       ", "").gsub("          ", "").gsub("      ", "")
  end


end
