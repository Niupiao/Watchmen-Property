class EmployersController < ApplicationController
  def show
    if session[:employer].ni?
      redirect_to login_path
    end
  end
  
end
