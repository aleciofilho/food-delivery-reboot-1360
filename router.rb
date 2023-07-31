# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    app_title
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.remove
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 0 then stop
    else
      puts 'Please press 1, 2, 3, 4 or 0'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    menu_title
    puts '1 - List all meals'
    puts '2 - Create a new meal'
    puts '3 - Edit a meals price'
    puts '4 - Delete a meal'
    puts '5 - List all customers'
    puts '6 - Create a new customer'
    puts '0 - Stop and exit the program'
    print '> '
  end

  def app_title
    print `clear`
    puts ''.center(50, '=')
    puts ' Welcome to batch #1360 Food Delivery App '.center(50, '=')
    puts ''.center(50, '=')
  end

  def menu_title
    puts ''
    puts ''.center(50, '=')
    puts ' What do you want to do next? '.center(50, '=')
    puts ''.center(50, '=')
  end
end