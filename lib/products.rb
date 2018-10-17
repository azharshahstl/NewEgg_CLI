
class Product 
  
  attr_accessor :url, :name, :price
  
 @@all = []
  
  def initialize(product_hash)
    @url = product_hash[:url]
    @name = product_hash[:name]
    @price = product_hash[:price] 
    @@all << self
  end
    
  def self.create_from_collection(array_of_products)
    array_of_products.each do |product_hash| 
      self.new(product_hash)
    end
  end
    
  def self.all
      @@all
  end
  
end