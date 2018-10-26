

class Scraper 
  
  def self.scrape_NewEgg_main_page
    doc = Nokogiri::HTML (open("https://www.newegg.com/"))
    eggxtra_hot_deals_url = doc.css("a.featured-deal-bottom-more")[2].attribute("href").value
  end
  
  def self.scrape_eggxtra_hot_deals(eggxtra_hot_deals_url) 
    doc = Nokogiri::HTML(open(eggxtra_hot_deals_url))
    
    products_array = []
    
    doc.css(".promotion-details").each do |product|
      product_url = product.css("a").attribute("href").value
      product_name = product.css(".itemDescription").text
      product_price = product.css(".price-current").text.strip.split(" ")[0]
      products_array << {url: product_url, name: product_name, price: product_price}
    end
    Product.create_from_collection(products_array)
  end
  
  def self.scrape_more_product_info(product)
    
    doc = Nokogiri::HTML(open(product.url))
    binding.pry
    #check line 25 and look at its children.  Should not need all the gsubs.
    self.info = doc.css(".grpBullet").css("li").text.gsub(/\s+/, " ").strip
    self.shipping_info = doc.css(".grpNote-ship").text.strip.gsub("\r\n       ", "").gsub("          ", "").gsub("      ", "")
    self.sold_by_info = doc.css(".grpNote-sold-by").text.strip.gsub("\r\n       ", "").gsub("          ", "").gsub("      ", "")
  end


end
