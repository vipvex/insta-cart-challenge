class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  protected

  def applicant_signed_in?
    !!current_applicant
  end

  def current_applicant
    puts session[:applicant]
    @current_applicant ||= Applicant.new(session[:applicant]) if session[:applicant]
  end

  def sign_in(applicant)
    session[:applicant] = applicant
  end

  def authenticate_applicant!
    redirect_to root_path unless applicant_signed_in?
  end
  
  def destroy_session
    reset_session
    redirect_to root_path
  end
end
