Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :home, only: [:index]

  get "#{I18n.t('.features_routes', locale: :en)}", to: 'home#features'
  get "#{I18n.t('.features_routes', locale: :de)}", to: 'home#features'
  get "#{I18n.t('.features_routes', locale: :fr)}", to: 'home#features'
  get "#{I18n.t('.features_routes', locale: :es)}", to: 'home#features'

  get "#{I18n.t('.header_pricing')}", to: 'home#pricing', as: :pricing
  get "#{I18n.t('.how_to_route')}", to: 'home#howto', as: :how_to
  match 'privacy-policy', to: 'home#privacy', via: :all
  match 'terms-of-service', to: 'home#tos', via: :all
  match 'faq', to: 'home#faq', via: :all
  match 'premium-reseller', to: 'home#premium', via: :all

  match '*a' => 'home#routing_error', via: :`
end
