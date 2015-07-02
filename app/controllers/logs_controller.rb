class LogsController < ApplicationController
  def new
    respond_to do |format|
      format.json do
        if @employee = Employee.find_by(id: params[:employee])
          if @qr = QrCode.find_by(id: params[:qr])
            if @employee.employer_id == @qr.company_id
              @log = Log.new(employee_id: params[:employee], qr_code_id: params[:qr])
              if @log.save
                render :json => QrCode.find(qr)
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
end
