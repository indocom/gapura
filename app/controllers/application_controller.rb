class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def ensure_admin
    if !user_signed_in? || !current_user.has_role?(:admin)
      redirect_to(root_path)
      return false
    end
    return true
  end

  def ensure_superuser
    if !user_signed_in? || !current_user.has_role?(:superuser)
      redirect_to(root_path)
      return false
    end
      return true
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
      render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
   end
end
