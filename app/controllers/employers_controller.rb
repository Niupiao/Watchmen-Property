class EmployersController < ApplicationController
  def show
    if session[:employer].nil?
      redirect_to login_path
    end
  end
  
end
