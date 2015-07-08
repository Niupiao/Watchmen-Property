class SessionsController < ApplicationController
  layout "login"
  require 'securerandom'
  
  def new
  end

  def create
    respond_to do |format|
      format.html do
        employer = Employer.find_by(username: params[:session][:username])
        if employer && employer.authenticate(params[:session][:password])
          session[:employer] = employer.id
          redirect_to employer
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
      format.json do
        employee = Employee.find_by(username: params[:username].downcase)
        if employee && employee.authenticate(params[:password])
          employee.auth = SecureRandom.urlsafe_base64 32
          employee.auth_expires_at = Time.now.to_i + 19600
          render :json => {employee: employee.id, auth: employee.auth, employer_id: employee.employer_id, auth_expires_at: employee.auth_expires_at}
        else
          render :json => {error: 'Invalid login information'}
        end
      end
    end
  end
end
