# frozen_string_literal: true

module Api
  # Authentication controller class
  class AuthenticationController < ApplicationController
    # logging in does not require authorization
    skip_before_action :authorized

    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(login_params[:password])
        token = issue_token(user)
        render json: { "username": user.username, "id": user.id, "token": token }
      else
        render json: { error: 'Wrong username or password' }, status: :unprocessable_entity
      end
    end

    def create
      # create! method returns an ActiveRecord::RecordInvalid error for invalid values
      # It is easier to handle this error without congesting the controller
      user = User.create!(register_params)
      render json: user, status: :created
    end

    private

    def register_params
      params.permit(:username, :password)
    end

    def login_params
      params.require(:authentication).permit(:username, :password)
    end
  end
end
