class Meal
  attr_reader :name
  attr_accessor :id, :price
  
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end