class QrCodesController < ApplicationController
  
  def new
    @qr = QrCode.new
  end
  
  def create
    @qr = QrCode.new(qr_code_params)
    @qr.company_id = session[:employer]
    if @qr.save
      flash[:success] = "QRCode successfully created"
      @qr_image = RQRCode::QRCode.new('https://moresi-property-bendrews.c9.io/logs/new/?format=json&qr=' + @qr.id.to_s)
      send_data @qr_image.as_png(:size => 400), type: 'image/png', filename: @qr.title + '.png'
    else
      render 'new'
    end
  end
  
  def show
    if @employee = Employee.find_by(id: params[:employee_id])
      @qr = QrCode.find(params[:id])
      if @employee.employer_id == @qr.company_id
        render @qr
      else
        render :text => 'Invalid Employer ID'
      end
    else
      render :text => 'Invalid Employee ID'
    end
  end
  
  def listings
    if employee = Employee.find_by(id: params[:employee_id])
      #if employee.auth == params[:auth] && employee.auth_expires_at >= Time.current 
        # Check to make sure that authorization token is current, and that the token isn't expired.
        qr_codes = QrCode.where("company_id = " + employee.employer_id.to_s)
        render :json => qr_codes
      #end
    end
  end
  
  private
  
  def qr_code_params
    params.require(:qr_code).permit(:title, :body, :company_id)
  end
end
