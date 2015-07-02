class EmployeesController < ApplicationController
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    @employee.employer_id = session[:employer]
    if @employee.save
      flash[:success] = "Employee successfully registered."
      redirect_to employees_path
    else
      render 'new'
    end
  end
  
  def index
  end
  
  private
  
  def employee_params
    params.require(:employee).permit(:name, :username, :password, :password_confirmation, :employer_id)
  end
  
end
