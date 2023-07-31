class MealView
  # def initialize 
  # end
  
  def ask_name
    puts "What's the name of the meal?"
    gets.chomp
  end
  
  def ask_price
    puts "What's the price of the meal?"
    gets.chomp.to_i
  end

  def display_all(meals)
    meals.each_with_index do |meal, i|
      puts "#{i + 1}. #{meal.name} | R$#{meal.price}"
    end 
  end

  def ask_for_index
    puts "Enter index:"
    gets.chomp.to_i - 1
  end

  def ask_to_update
    puts "What is the new price?"
    gets.chomp.to_i
  end
end