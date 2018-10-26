
class Product 
  
  attr_accessor :url, :name, :price, :info, :shipping_info, :sold_by_info
  
 @@all = []
  
  def initialize(product_hash)
    @url = product_hash[:url]
    @name = product_hash[:name]
    @price = product_hash[:price] 
    @@all << self
  end
    
  def self.create_from_collection(products_array)
    products_array.each do |product_hash| 
      self.new(product_hash)
    end
  end
    
  def self.all
      @@all
  end
  
end