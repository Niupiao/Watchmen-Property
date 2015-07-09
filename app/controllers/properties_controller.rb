class PropertiesController < ApplicationController
    
  def new
      @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    @property.company_id = session[:employer]
    if @property.save
        flash[:success] = "Property successfully created"
        redirect_to properties_path
    else
      render'new'
    end
    redirect_to listings_path
  end
  
  def listings
    respond_to do |format|
      format.json do
        if employee = Employee.find_by(id: params[:employee_id])
          #if employee.auth == params[:auth] && employee.auth_expires_at >= Time.current 
            # Check to make sure that authorization token is current, and that the token isn't expired.
            properties = Property.where(company_id: employee.employer_id.to_s)
            render :json => properties, :include => :tasks
          #end
        end
      end
      format.html do
        @properties = Property.where(company_id: session[:employer])
      end
    end
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :company_id)
  end
end
