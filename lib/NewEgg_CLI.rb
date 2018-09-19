require_relative "../lib/product_scraper.rb" 
require_relative "../lib/products.rb" 
require "nokogiri"
require "colorize" 

class NewEggCLI 
  
  def run 
    make_products
    display_products
  end
  
  def make_products 
    array_of_products = Scraper.scrape_eggxtra_hot_deals
    Product.create_from_collection(array_of_products)
  end
  
  def display_products
  end
    
  
end 

