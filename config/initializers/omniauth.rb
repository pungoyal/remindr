Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'iGMYWTqDHPJlkdsgbOjoMw', 'kzNA1caszG7rCyTG04lP97iqgGYxlfX9dJEmWMo6pU'
  provider :facebook, '2433943802', '76cd8435d2bceda5a3edc7060134e2b1'
end
