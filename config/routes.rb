Rails.application.routes.draw do

  root 'static_pages#index'

  resource :applicant, except: [:index, :delete] do # , only: [:new, :create, :edit, :update, :show] do #, 
    get :background_check
    get :confirm_background
    delete :log_out
  end

end
 