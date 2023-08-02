class EmployeeView
  def display(riders)
    riders.each_with_index do |rider, i|
      puts "#{i + 1}. #{rider.username}"
    end
  end
end