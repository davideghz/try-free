class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale

    # save user locale on "locale" attribute
    if current_user
      current_user.update(locale: locale) if current_user.locale != locale
    end

  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
