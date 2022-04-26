# frozen_string_literal: true

module ControllerSpecHelper
  SESSION_SECRET = ENV['SESSION_SECRET']

  def token_generator(user_id)
    JWT.encode({ user_id: user_id }, SESSION_SECRET)
  end

  def valid_headers
    {
      'x-access-token' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'x-access-token': nil,
      'Content-type': 'application/json'
    }
  end
end
