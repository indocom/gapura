class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def ensure_admin
    unauthorized_access unless user_signed_in? && current_user.has_role?(:admin)
  end

  def ensure_superuser
    unauthorized_access unless user_signed_in? && current_user.has_role?(:superuser)
  end

  def unauthorized_access
    user_signed_in? ? not_found : redirect_to new_user_session_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
   end
end
