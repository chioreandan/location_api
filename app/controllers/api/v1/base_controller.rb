# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  # before_action :authenticate_user!
  acts_as_token_authentication_handler_for User, fallback: :exception

end
