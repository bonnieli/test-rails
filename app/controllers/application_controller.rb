# frozen_string_literal: true

# Application controller with setup applicable to all controllers
class ApplicationController < ActionController::API
  include ExceptionHandler
  # Ensures that all the controller actions require authorization
  before_action :authorized

  SESSION_SECRET = ENV['SESSION_SECRET']

  def issue_token(user)
    exp = 30.minutes.from_now.to_i
    payload = { user_id: user.id, exp: exp }
    JWT.encode(payload, SESSION_SECRET, 'HS256')
  end

  def token
    request.headers['x-access-token']&.split(' ')&.last
  end

  def decoded_token
    JWT.decode(token, SESSION_SECRET, true, { algorithm: 'HS256' })
  rescue JWT::DecodeError
    raise ExceptionHandler::InvalidToken, 'Invalid or missing token, please login'
  end

  def user_id
    decoded_token[0]['user_id']
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render(json: { message: 'Please log in' }, status: :unauthorized) unless logged_in?
  end
end
