class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    return {} if I18n.locale == I18n.default_locale
    { lang: I18n.locale }
  end

  private

  def set_locale
    lang = params[:lang]
    I18n.locale = I18n.locale_available?(lang) ? lang : I18n.default_locale
  end

end
