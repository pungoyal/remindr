Remindr::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users
  resources :authentications

  root :to => "home#index"
end
