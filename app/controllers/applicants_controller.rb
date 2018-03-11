class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!, only: [:edit, :update, :confirm, :background_check]
  before_action :remember_applicant!, only: [:new]
  before_action :set_applicant, only: [:edit, :update, :confirm, :background_check]

 
  def new
    
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.valid?
      
      sign_in(applicant_params) #sign_in(@applicant) 
      
      redirect_to background_check_applicant_path(@applicant)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
    @applicant.assign_attributes(applicant_params)
    if @applicant.valid? # Use @applicant.update to persist record in database
      
      redirect_to edit_applicant_path(@applicant)
    else
      render 'update'
    end
  end
  
  def background_check
  end
  
  def confirm_background
    # Use @applicant_params.update(confirmed_background_check: true) to persist in database
    session[:applicant][:confirmed_background_check] = true
    redirect_to edit_applicant_path(@applicant)
  end
  
  def log_out
    destroy_session
  end
  
  private
  
    def set_applicant
      @applicant = current_applicant
    end
  
    def applicant_params
      params.require(:applicant).permit(
        :first_name, 
        :last_name, 
        :email, 
        :phone, 
        :zip_code, 
        :confirmed_background_check
      )
    end
    
    def remember_applicant!
      redirect_to background_check_applicant_path if current_applicant && current_applicant.confirmed_background_check? == false
      redirect_to edit_applicant_path if current_applicant && current_applicant.confirmed_background_check?
    end
end
