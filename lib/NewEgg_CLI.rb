
require_relative "../lib/product_scraper.rb" 
require_relative "../lib/products.rb" 
require "nokogiri"
require "colorize" 

class NewEggCLI 
  
  def run 
    displayCLI_options
  end
  
  def make_products 
    array_of_products = Scraper.scrape_eggxtra_hot_deals
    Product.create_from_collection(array_of_products)
  end
  
  def display_products
    input = gets.strip.to_i
    counter == 0
    Product.all.each  do |product| 
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "Product: #{counter}"
      puts "PRODUCT NAME: #{product.name.colorize(:green)}"
        if product.price == nil
          puts "PRODUCT PRICE: NOT AVAILABLE"
        else
          puts "PRODUCT PRICE: #{product.price.colorize(:green)}"
        end
      puts "PRODUCT URL: #{product.url.colorize(:green)}"
      #sleep(0.5)
      counter += 1
    end
  end
  
  def displayCLI_options 
    puts "Would you like to see the Products available on NewEggs Eggxtra hot deals? 1 if yes, 2 if no. "
    input = gets.strip.to_i
    if input == 1
      make_products
      array_of_products = make_products
      puts "There are currently #{array_of_products.size} products to view."
      puts "How many products would you like to view?"
      display_products
      input = gets.strip.to_i 
      if input == 1 
        display_all_products
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i
        product_info_url = Product.all[input + 1].url
        binding.pry
        #Scraper.scrape_more_product_info(product_info_url)
      elsif input == 2
        display_first_25_products
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i 
      elsif input == 3 
        display_rest_of_products
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i
    else
      puts "Sorry you are not interested now, come back again when you are :)."
    end
  end 
  
  def display_first_25_products 
    counter = 1
    Product.all.each  do |product| 
      while counter < 26
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "Product: #{counter}"
      puts "PRODUCT NAME: #{product.name.colorize(:green)}" 
      puts "PRODUCT PRICE: #{product.price.colorize(:green)}" 
      puts "PRODUCT URL: #{product.url.colorize(:green)}"
      sleep(0.5)
      counter += 1
      end
    end
  end 
  
  def display_rest_of_products
    counter = 26
    Product.all.each  do |product| 
       
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "Product: #{counter}"
      puts "PRODUCT NAME: #{product.name.upcase.colorize(:green)}" 
      puts "PRODUCT PRICE: #{product.price.colorize(:green)}" 
      puts "PRODUCT URL: #{product.url.colorize(:green)}"
      sleep(0.5)
      counter += 1
    end
  end
    
  
end 

