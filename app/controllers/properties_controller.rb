class PropertiesController < ApplicationController
    
  def new
      @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    @property.company_id = session[:employer]
    if @property.save
        flash[:success] = "QRCode successfully created"
    end
  end
  
  def listings
    if employee = Employee.find_by(id: params[:employee_id])
      #if employee.auth == params[:auth] && employee.auth_expires_at >= Time.current 
        # Check to make sure that authorization token is current, and that the token isn't expired.
        properties = Property.where(company_id: employee.employer_id.to_s)
        render :json => qr_codes
      #end
    end
  end
  
  private
  
  def property_params
    params.require(:property).permit(:location, :company_id)
  end
end
