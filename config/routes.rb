Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :home, only: [:index]

  get "#{I18n.t('.features_routes')}", to: 'home#features', as: :features

  get "#{I18n.t('.header_pricing')}", to: 'home#pricing', as: :pricing
  get "#{I18n.t('.how_to_route')}", to: 'home#howto', as: :how_to
  get "#{I18n.t('.privacy_route')}", to: 'home#privacy', as: :privacy_policy
  get "#{I18n.t('.terms_service_route')}", to: 'home#tos', as: :terms_of_service
  get "#{I18n.t('.faq_route')}", to: 'home#faq', as: :faq
  get "#{I18n.t('.premium_route')}", to: 'home#premium', as: :premium_reseller

  get '*a' => 'home#routing_error' unless Rails.env.development?
end
