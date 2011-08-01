Remindr::Application.routes.draw do
  match 'r' => 'home#r'
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :authentications

  root :to => "authentications#index"
end
