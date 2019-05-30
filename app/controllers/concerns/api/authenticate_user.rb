module Api::AuthenticateUser
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_user

  class AuthenticationError < StandardError; end

  included do
    rescue_from AuthenticationError, with: :render_authentication_error

    before_action :authorize_user!
  end

  def authorize_user!
    authenticate_with_http_token do |token|
      raise AuthenticationError if token.blank? && load_current_user(token).blank?
    end
  end

  def load_current_user(token)
    @current_user = OpenStruct.new(user_id: token) unless token
  end
end
