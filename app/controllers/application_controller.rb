# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def moon
    cookies[:theme] = {
      value: 'dark'
    }

    redirect_back(fallback_location: home_path)
  end

  def sun
    cookies.delete(:theme)

    redirect_back(fallback_location: home_path)
  end

  private

  def after_sign_in_path_for(_resource_or_scope)
    home_path
  end
end
