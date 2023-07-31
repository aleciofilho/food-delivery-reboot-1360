class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  #Create Read Update Destroy

  def create(meal) # Create
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  def all # Read
    @meals
  end

  def find(id) # Read
    # @meals.select { |meal| meal.id == id } # => [meal_x, meal_y, meal_z]
    @meals.find { |meal| meal.id == id } # => meal_x
  end
  
    def find_by_index(index) # Read
      @meals[index]
    end
  
  def update(index, new_price) # Update
    @meals[index].price = new_price
    save_csv
  end

  def destroy(index) # Destroy
    @meals.delete_at(index)
    save_csv
  end

  private 

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i
      meal = Meal.new(id: id, name: name, price: price)
      @meals << meal
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %i[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end