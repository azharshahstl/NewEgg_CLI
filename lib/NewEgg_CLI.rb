
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
  
  def display_all_products
    counter = 1
    Product.all.each  do |product| 
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "Product: #{counter}"
      puts "PRODUCT NAME: #{product.name.colorize(:green)}" 
     # puts "#{product.price.colorize(:green)}" 
      puts "PRODUCT URL: #{product.url.colorize(:green)}"
      #sleep(0.5)
      counter += 1
    end
  end
  
  def displayCLI_options 
    puts "Would you like to see the Products available on NewEggs Eggxtra hot deals? 1 if yes, 2 if no. "
    input = gets.strip
    if input == "1"
      make_products
      puts "If you would you like to see all products displayed, enter 1"
      puts "If you would like to see the first 25 products, enter 2"
      puts "If you would like to see products 26 to the end, enter 3"
      input = gets.strip.to_i 
      if input == 1 
        display_all_products
        Product.all[input +1].url
        binding.pry
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i
        #Product.all[input +1].url
        
      elsif input == 2
        display_first_25_products
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i 
      elsif input == 3 
        display_rest_of_products
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i
      end
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
      puts "#{product.price.colorize(:green)}" 
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
      puts "#{product.price.colorize(:green)}" 
      puts "PRODUCT URL: #{product.url.colorize(:green)}"
      sleep(0.5)
      counter += 1
    end
  end
    
  
end 

