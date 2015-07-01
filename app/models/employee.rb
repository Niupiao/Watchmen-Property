class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :password, length: {minimum: 6}, presence: true
  validates :employer_id, presence: true
  
  has_secure_password
end
