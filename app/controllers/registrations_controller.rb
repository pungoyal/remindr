class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:auth] = nil unless @user.new_record?
  end

  private
  def build_resource *args
    super
    if session[:auth]
      @user.apply_auth session[:auth]
      @user.valid?
    end
  end
end
