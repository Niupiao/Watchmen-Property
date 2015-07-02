class Log < ActiveRecord::Base
  validates :qr_code_id, presence: true
  validates :employee_id, presence: true
end
