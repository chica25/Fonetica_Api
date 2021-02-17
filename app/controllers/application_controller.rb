class ApplicationController < ActionController::API

  # protect_from_forgery with: :exception
  protect_from_forgery unless: -> {request.format.json? }
end
