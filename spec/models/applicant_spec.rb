require 'rails_helper'

RSpec.describe Applicant, type: :model do
  
  describe 'Validations' do
    
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :zip_code }
    

    
    it { is_expected.to validate_length_of(:first_name).is_at_most(120) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(120) }
    it { is_expected.to validate_length_of(:email).is_at_most(120) }
    it { is_expected.to validate_length_of(:phone).is_at_most(20) }
    it { is_expected.to validate_length_of(:zip_code).is_at_most(20) }
    
  end
    
end
