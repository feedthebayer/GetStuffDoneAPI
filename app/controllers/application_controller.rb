class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def authenticated?
    authenticate_or_request_with_http_basic do |u, p|
      @current_user = User.find_by(username: u, password: p)
    end
  end

  def current_user
    @current_user
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end
end
