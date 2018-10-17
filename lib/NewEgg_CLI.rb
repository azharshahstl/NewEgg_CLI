class NewEggCLI 
  
  def run 
    make_products
    displayCLI_options
  end
  
  def make_products 
    eggxtra_hot_deals_url = Scraper.scrape_NewEgg_main_page
    Scraper.scrape_eggxtra_hot_deals(eggxtra_hot_deals_url) 
    Product.create_from_collection(array_of_products)
  end
  
  def display_products#(input)
    counter = 1
    Product.all.each  do |product| 
      if counter <= input
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
        sleep(0.5)
        counter += 1
      end
    end
    puts "Enter the number of the product you would like more info on: "
  end
  
  def displayCLI_options 
    puts "Would you like to see the Products available on NewEggs Eggxtra hot deals? 1 if yes, 2 if no. "
    input = gets.strip.to_i
    if input == 2 
      puts "Sorry you are not interested now, come back again when you are :)."
    elsif input == 1
      puts "There are currently #{Product.all.size} products to view."
      puts "How many products would you like to view?"
      #get input(products_viewed) and validate it completely.
      display_products#(products_viewed)
      
      input = gets.strip.to_i 
      #validate line 46 input.
      product = Product.all[input - 1]
      Scraper.scrape_more_product_info(product) if product.info = nil
      display_product(product)
      #prompt user and do what they want to do. 
    end
  end 
  
  def display_product(product)
    puts "#{product.info}"
    puts "#{product.shipping_info}"
    puts "#{product.sold_by_info}"
  end
    
  
end 

