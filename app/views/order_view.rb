class OrderView
  def ask_index
    puts "Enter index"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, i|
      puts "#{i + 1}. #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name}"
    end
  end
end