class NewEggCLI 
  
  def run 
    make_products
    displayCLI_options
  end
  
  def make_products 
    eggxtra_hot_deals_url = Scraper.scrape_NewEgg_main_page
    Scraper.scrape_eggxtra_hot_deals(eggxtra_hot_deals_url) 
  end
  
  def display_products(input)
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
  end
  
  def displayCLI_options 
    puts "Would you like to see the Products available on NewEggs Eggxtra hot deals? 1 if yes, 2 if no. "
    input = gets.strip.to_i
    if input == 2 
      puts "Sorry you are not interested now, come back again when you are. :)"
      exit
    elsif input == 1
      puts "There are currently #{Product.all.size} products to view."
      puts "How many products would you like to view?"
      input = gets.strip.to_i 
        if input >= 1 && input <= Product.all.size
        display_products(input)
        puts "Enter the number of the product you would like more info on: "
        input = gets.strip.to_i
        product = Product.all[input - 1]
        Scraper.scrape_more_product_info(product)
        puts "PRODUCT NAME: #{product.name.colorize(:green)}" 
        display_product(product)
        displayCLI_options
        else 
          puts "I am sorry, your input was ouside the range of products found."
          displayCLI_options
        end
    else 
      puts "I am sorry, I did not understand what you entered."
      displayCLI_options
    end
  end 
  
  def display_product(product)
    puts "MORE PRODUCT INFO: #{product.info.colorize(:yellow)}"
    puts "SOLD AND SHIPPED BY: #{product.sold_and_shipped_by.colorize(:yellow)}"
  end
    
  
end 

