require "csv"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv if File.exist?(@csv_file)
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_rider_by_index(index)
    all_riders[index]
  end

  def all_riders
    # return all employees that are riders
    @employees.select { |employee| employee.rider? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
