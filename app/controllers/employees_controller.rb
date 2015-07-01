class EmployeesController < ApplicationController
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee successfully registered."
      redirect_to employee_index_path
    else
      render 'new'
    end
  end
  
  private
  
  def employee_params
    params.require(:employee).permit(:name, :password, :employer_id)
  end
  
end
