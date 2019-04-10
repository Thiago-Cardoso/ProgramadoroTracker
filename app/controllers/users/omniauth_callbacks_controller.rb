module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # Facebook
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication # Throws if @user is not activated
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    # Github
    def github
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to new_user_session_path
    end
  end
end