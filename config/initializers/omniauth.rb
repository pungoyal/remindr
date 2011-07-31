Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'

  provider :twitter, ENV['T_KEY'], ENV['T_SECRET']
  provider :facebook, ENV['F_KEY'], ENV['F_SECRET']
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id', :scope => 'email'
end
