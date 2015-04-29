class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def authenticated?
    authenticate_or_request_with_http_basic do
      |u, p| User.where(username: u, password: p).present?
    end
  end
end
