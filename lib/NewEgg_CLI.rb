require_relative "../lib/product_scraper.rb" 
require_relative "../lib/products.rb" 
require "nokogiri"
require "colorize" 

class NewEggCLI 
  
  def run 
    self.make_products
    self.display_products
  end
  
  def self.make_products 
    array_of_products = Scraper.scrape_eggxtra_hot_deals
    Product.create_from_collecttion(array_of_products)
  end
  
  def display_products
    
  
end 

