class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(_resource_or_scope)
    home_path
  end
end
