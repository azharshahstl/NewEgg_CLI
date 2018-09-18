class Product 
  
  attr_accessor :url, :name, :price, :item_action
  
  @all = []
  
  def initialize(product_hash)
    @url = product_hash[:url]
    @name = product_hash[:name]
    @price = product_hash[:price] 
    @item_action = product_hash[:item_action]
    
    @all << self
    
  
end