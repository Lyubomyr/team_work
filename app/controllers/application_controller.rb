class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_organization

  before_action :authenticate_user!#, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name]
    devise_parameter_sanitizer.for(:account_update).concat [:name]
  end

protected

  def current_organization
    @current_organization ||= current_user.try(:organization)
  end

private
      def if_admin?
      if current_user == User.find(1)
      else
        flash[:error] = 'You are not Admin'
         redirect_to root_path
       end
    end
end
