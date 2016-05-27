module ApplicationHelper

  def alternate_locales
    # Remove current locale from list
    aval_locales_but_current = I18n.available_locales - [locale]
    aval_locales_but_current.map{ |l| yield(l) }.join.html_safe
  end

end
