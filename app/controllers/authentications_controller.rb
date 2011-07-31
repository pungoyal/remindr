class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    #render :text => request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully!"
      sign_in_and_redirect :user, authentication.user
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
      flash[:notice] = "Authentication successful!"
      redirect_to authentications_url
    else
      user = User.find_by_email(auth['user_info']['email']) || User.new

      user.apply_auth auth
      if user.save
        flash[:notice] = "User registered!"
        sign_in_and_redirect :user, user
      else
        session[:auth] = auth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy

    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
