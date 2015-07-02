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
  
  private
  
  def qr_code_params
    params.require(:qr_code).permit(:title, :body, :company_id)
  end
  
end
