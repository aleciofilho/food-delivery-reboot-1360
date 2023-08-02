require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # aks info (username & password)
    # @repo.find_by_username
    # if found and password matches: log user in
    # else: try again
    username = @sessions_view.ask_for(:username)
    password = @sessions_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password

    @sessions_view.print_wrong_credentials
    login
  end
end
