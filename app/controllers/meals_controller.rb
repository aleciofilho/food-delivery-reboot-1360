require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def add
    # ask name
    name = @view.ask_name
    # ask price
    price = @view.ask_price
    # instantiate meal
    meal = Meal.new(name: name, price: price)
    # store meal
    @meal_repository.create(meal)
  end

  def list
    # get all meals
    meals = @meal_repository.all
    # display all meals
    @view.display_all(meals)
  end

  def edit
    # display all meals
    list
    # ask for index
    index = @view.ask_for_index
    # find meal by index
    meal = @meal_repository.find_by_index(index)
    # @meal_repository.all[index]
    # ask for new info
    new_price = @view.ask_to_update
    # update info
    @meal_repository.update(index, new_price)
  end

  def remove
    # display all meals
    list
    # ask for index
    index = @view.ask_for_index
    # destroy meal by index
    @meal_repository.destroy(index)
  end
end