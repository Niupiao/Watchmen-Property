class QrCodesController < ApplicationController
  
  def new
    @qr = QrCode.new
    @property = Property.find_by(id: params[:property])
  end
  
  def create
    @qr = QrCode.new(qr_code_params)
    @qr.property_id = params[:property]
    @qr.company_id = session[:employer]
    if @qr.save
      flash[:success] = "QRCode successfully created"
      @qr_image = RQRCode::QRCode.new(@qr.id.to_s)
      send_data @qr_image.as_png(:size => 400), type: 'image/png', filename: @qr.location + '.png'
    else
      render 'new'
    end
  end
  
  def show
    @qr = QrCode.find_by(id: params[:id])
    if session[:employer].nil? || session[:employer] != @qr.company_id
      render :text => 'Invalid employer'
    end
  end
  
  def listings
    if employee = Employee.find_by(id: params[:employee_id])
      #if employee.auth == params[:auth] && employee.auth_expires_at >= Time.current 
        # Check to make sure that authorization token is current, and that the token isn't expired.
        qr_codes = QrCode.where(company_id: employee.employer_id.to_s)
        render :json => qr_codes
      #end
    end
  end
  
  private
  
  def qr_code_params
    params.require(:qr_code).permit(:location, :content, :property_id, :company_id)
  end
end
