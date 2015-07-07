class Property < ActiveRecord::Base
    has_many :qr_codes
    has_many :tasks, dependent: :destroy
end
