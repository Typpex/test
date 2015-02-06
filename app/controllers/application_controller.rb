class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    change_locale_subdomain = false

    # if session["locale"].to_sym != I18n.locale
    #   change_locale_subdomain = true
    #   session["locale"] = I18n.locale
    # end
    # if request.subdomain.blank? || change_locale_subdomain
    #   redirect_to request.url.gsub( /:\/\//, "://#{ session["locale"] }." )
    # end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
