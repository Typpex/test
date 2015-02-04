Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :home, only: [:index]

  match 'features', to: 'home#features', via: :all
  match 'pricing', to: 'home#pricing', via: :all
  match 'how-to', to: 'home#howto', via: :all
  match 'features', to: 'home#features', via: :all
  match 'privacy-policy', to: 'home#privacy', via: :all
  match 'terms-of-service', to: 'home#tos', via: :all
  match 'faq', to: 'home#faq', via: :all
  match 'premium-reseller', to: 'home#premium', via: :all

  match '*a' => 'home#routing_error', via: :`
end
