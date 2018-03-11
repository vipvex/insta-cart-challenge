class Applicant < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 120 }
  validates :last_name, presence: true, length: { maximum: 120 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 120 }
  validates :phone, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :zip_code, presence: true, length: { maximum: 20 }
  
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  #validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/, message: "must be 10 digits"
  
  def confirmed_background_check?
    confirmed_background_check
  end
    
end
