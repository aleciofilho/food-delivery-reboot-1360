class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @view = OrderView.new
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meal_view = MealsView.new
    @customer_view = CustomersView.new
    @employee_view = EmployeeView.new
  end

  def add
    # ask meal
    # # get all meals
    meals = @meal_repository.all
    # # display all meals
    @meal_view.display(meals)
    meal_index = @view.ask_index
    meal = @meal_repository.find_by_index(meal_index)

    # ask customer
    customers = @customer_repository.all
    # # display all customers
    @customer_view.display(customers)
    customer_index = @view.ask_index
    customer = @customer_repository.find_by_index(customer_index)

    # ask employee
    employees = @employee_repository.all_riders
    # # display all riders
    @employee_view.display(employees)
    employee_index = @view.ask_index
    employee = @employee_repository.find_rider_by_index(employee_index)

    # instantiate new order
    order = Order.new(meal: meal, customer: customer, employee: employee)

    # save to repo
    @order_repository.create(order)

  end

  def list_all_undelivered
    # get all undelivered orders from order_repo
    orders = @order_repository.all_undelivered
    # list all undleivered orders
    @view.display(orders)
  end

  def list_all_my_undelivered(current_user)
    orders = @order_repository.all_my_undelivered(current_user)
    @view.display(orders)
  end

  def mark_order_as_delivered(current_user)
    # list all my undelivered 
    list_all_my_undelivered(current_user)
    # ask index 
    index = @view.ask_index
    
    # find my undelivered order by index
    order = @order_repository.find_undelivered_by_index(current_user, index)
    
    # mark order as delivered
    @order_repository.mark_as_delivered(order)
  end

end