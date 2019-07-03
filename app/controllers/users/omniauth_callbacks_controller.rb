# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :set_user, except: %i[failure passthru]
    before_action :ensure_superuser, only: %i[passthru]

    # Facebook callback
    def facebook
      if @user.persisted?
        sign_in_and_redirect @user
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'Facebook')
        end
      else
        flash[:error] = 'There was a problem signing you in through Facebook.' \
          ' Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    # Google callback
    def google_oauth2
      if @user.persisted?
        sign_in_and_redirect @user
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'Google')
        end
      else
        flash[:error] = 'There was a problem signing you in through Google.' \
          ' Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    protected

    def set_user
      @provider_data = filter_provider_data
      @user = User.find_by(
        provider: @provider_data['provider'], uid: @provider_data['uid']
      )

      create_new_user unless @user
    end

    def filter_provider_data
      request.env['omniauth.auth'].slice('provider', 'uid', 'info')
             .tap do |data|
        data['info'] = data['info'].slice('name', 'email')
      end
    end

    def create_new_user
      if User.exists?(email: @provider_data['info']['email'])
        flash[:error] = 'You have signed up with another provider.\n' \
            'Please login using the other providers!'
        return redirect_to new_user_session_url
      end
      session[:provider_data] = @provider_data
      redirect_to new_user_registration_url(from_provider: true)
    end

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end
  end
end
