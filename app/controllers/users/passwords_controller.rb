# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_superuser
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  protected
  
  def ensure_superuser
    if !user_signed_in? || !current_user.has_role?(:superuser)
      redirect_to(root_path)
      return false;
    end
    return true
  end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
