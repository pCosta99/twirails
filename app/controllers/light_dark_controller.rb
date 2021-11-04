class LightDarkController < ApplicationController
  def moon
    cookies[:theme] = {
      value: 'dark'
    }
    @dark = true
  end

  def sun
    cookies.delete(:theme)
    @dark = false
  end
end
