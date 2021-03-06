class NewEggCLI 
  
  def run 
    make_products
    displayCLI_options
  end
  
  def make_products 
    eggxtra_hot_deals_url = Scraper.scrape_NewEgg_main_page
    Scraper.scrape_eggxtra_hot_deals(eggxtra_hot_deals_url) 
  end
  
  def display_products(products_input)
    counter = 1
    Product.all.each  do |product| 
      if counter <= products_input
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
      products_input = gets.strip.to_i 
        if products_input >= 1 && products_input <= Product.all.size
          display_products(products_input)
          get_product(products_input)
        else 
          handle_error("I am sorry, your input was ouside the range of products found.")
        end
    else 
      handle_error("I am sorry, I did not understand what you entered.")
    end
  end 
  
  def display_product(product)
    puts "MORE PRODUCT INFO: #{product.info.colorize(:yellow)}"
    puts "SOLD AND SHIPPED BY: #{product.sold_and_shipped_by.colorize(:yellow)}"
  end
    
  def get_product(products_input)
    puts "Enter the number of the product you would like more info on: "
    product_input = gets.strip.to_i
    if product_input >= 1 && product_input <= products_input
       product = Product.all[product_input - 1]
       Scraper.scrape_more_product_info(product) if product.info == nil 
       puts "PRODUCT NAME: #{product.name.colorize(:green)}" 
       puts "PRODUCT PRICE: #{product.price.colorize(:green)}"
       display_product(product)
       puts "Would you like to see the #{products_input} products again? (Y or N)"
       review_input = gets.chomp.downcase
        if review_input == "y" || review_input == "yes"
          display_products(products_input)
          get_product(products_input)
        elsif review_input == "n" || review_input == "no"
          displayCLI_options
        else 
          handle_error("I am sorry, I did not understand what you wanted to do.")
        end
     else 
        handle_error("I am sorry, your input was ouside the range of products found.")
     end
  end
        
  def handle_error(string)
    puts string
    displayCLI_options
  end
  
end 

