class QrCodesController < ApplicationController
  
  def new
    @qr = QrCode.new
  end
  
  def create
    @qr = QrCode.new(qr_code_params)
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
  
  private
  
  def qr_code_params
    params.require(:qr_code).permit(:location, :content, :company_id)
  end
  
end
