# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'rails_helper'

"""
// ---------------------------------------------------------------- //
//                                                                  //
//                 PLEASE DO NOT MODIFY THIS FILE.                  //
//               Hatchways automation depends on it.                //
//                                                                  //
// ---------------------------------------------------------------- //
"""

# Test suite for Login
RSpec.describe 'Authentications API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_credentials) do
    {
      username: user.username,
      password: user.password
    }.to_json
  end

  describe 'POST /api/login' do
    context 'when the request is valid' do
      before { post '/api/login', params: valid_credentials, headers: headers }

      it 'should allow login request from user.' do
        expect(response).to have_http_status(200)

        parsed_response = JSON.parse(response.body)
        expect(parsed_response["username"]).to eq(user.username)
        expect(parsed_response["id"]).to eq(user.id)
      end
      
    end
  end
end
# rubocop:enable Metrics/BlockLength
