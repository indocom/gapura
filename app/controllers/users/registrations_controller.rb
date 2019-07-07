# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :ensure_superuser, except: [:new, :create, :cancel]

  # GET /resource/sign_up
  def new
    if params[:from_provider]
      @user = User.new
      render 'new_from_provider'
    else
      not_found && return
      super
    end
  end

  # POST /resource
  def create
    if params[:from_provider]
      @user = create_user_from_provider_data(session[:provider_data], configure_user_data_from_params)

      if @user.persisted?
        sign_in(@user, scope: :user)
        redirect_to after_sign_up_path_for(@user)
        session.delete(:provider_data)
      else
        render 'new_from_provider'
      end
    else
      not_found && return
      super
      if resource.persisted?
        flash[:popup_alert] = 'Thank you for registering!\n'\
          'Please confirm your account in your email'
      end
    end
  rescue
    not_found
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  def cancel
    session.delete(:provider_data) if session[:provider_data]
    expire_data_after_sign_in!

    redirect_to new_user_session_url
  end

  protected

  def configure_user_data_from_params
    params.require(:user).permit(:username)
  end

  def create_user_from_provider_data(provider_data, user_data)
    User.create do |user|
      user.provider = provider_data['provider']
      user.uid = provider_data['uid']
      user.email = provider_data['info']['email']
      user.username = user_data['username']
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:user])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
