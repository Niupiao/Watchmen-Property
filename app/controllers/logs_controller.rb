class LogsController < ApplicationController
  def new
    respond_to do |format|
      format.json do
        if @employee = Employee.find_by(id: params[:employee])
          if @qr = QrCode.find_by(id: params[:qr])
            if @employee.employer_id == @qr.company_id
              @log = Log.new(employee_id: params[:employee], qr_code_id: params[:qr], property_id: @qr.property_id)
              if @log.save
                render :json => {property: Property.find(@qr.property_id).name, location: @qr.location, content: @qr.content}
              else
                render :json => {error: 'Log not created'}
              end
            else
              render :json => {error: 'Invalid Company'}
            end
          else
            render :json => {error: 'Invalid QR Code'}
          end
        else
          render :json => {error: 'Invalid Employee'}
        end
      end
    end
  end
  
  def index
    if session[:employer].nil?
      redirect_to login_path
    end
    @property = Property.find_by(id: params[:property])
  end
end
