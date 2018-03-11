class ApplicantsController < ApplicationController
 def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      
      flash[:error] = "Please double check your form."
      redirect_to background_check_applicant_path(@applicant)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
    if @applicant.update(applicant_params)
      redirect_to confirm_applicant_path(@applicant)
    else
      render 'update'
    end
  end
  
  def background_check
  end
  
  def confirm
  end
  
  private
  
    def set_applicant
      @applicant = Applicant.new
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
end
