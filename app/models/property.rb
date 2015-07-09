class Property < ActiveRecord::Base
    validates :name, presence: true
    has_many :qr_codes
    has_many :tasks, dependent: :destroy
end
