class ApplicationController < ActionController::API
  include ::Api::AuthenticateUser
end
