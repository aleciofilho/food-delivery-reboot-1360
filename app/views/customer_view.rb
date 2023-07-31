class CustomerView
    # def initialize 
  # end
  
  def ask_name
    puts "What's the name of the customer?"
    gets.chomp
  end
  
  def ask_address
    puts "What's the address of the customer?"
    gets.chomp
  end

  def display_all(customers)
    customers.each_with_index do |customer, i|
      puts "#{i + 1}. #{customer.name} | #{customer.address}"
    end 
  end
end