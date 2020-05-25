# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_year
    2_019
  end

  def ensure_admin
    unauthorized_access unless user_signed_in? && current_user.has_role?(:admin)
  end

  def ensure_superuser
    # rubocop:todo Style/GuardClause
    unless user_signed_in? && current_user.has_role?(:superuser)
      unauthorized_access
    end
    # rubocop:enable Style/GuardClause
  end

  def unauthorized_access
    user_signed_in? ? not_found : redirect_to(new_user_session_url)
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  rescue StandardError
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[username email password password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :sign_in,
      keys: %i[login password password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[username email password password_confirmation current_password]
    )
  end # rubocop:todo Metrics/MethodLength
end
