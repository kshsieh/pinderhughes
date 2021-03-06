class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :primary_user_email
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    admin_path
  end

  protected

    def configure_permitted_parameters
      # devise_parameter_sanitizer.for(:account_update) << :last_name
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(
        :first_name, :last_name, :biography, 
        :password, :password_confirmation, :current_password)
      end
    end

  private
    def primary_user_email
      User.where(primary: true).first.email
    end

end
