class ErrorsController < ApplicationController
  def record_not_found
    render status: 404
  end

  def not_found
    render status: 404
  end
end
