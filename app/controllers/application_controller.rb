class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
    if session[:locale] != I18n.locale
      RemailderCommercial::Application.reload_routes!
      session[:locale] = I18n.locale
    end
  end

  private 
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
