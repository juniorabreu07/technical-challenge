# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /index' do
    it 'gets profile for pepe' do
      username = 'pepe'
      get "/api/v1/users/#{username}"
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body).to have_key('status')
      expect(body).to have_key('data')
      expect(body).to have_key('msg')
      expect(body['data'].class.to_s).to eq('Hash')
      expect(body['data']['login']).to eq('pepe')
    end

    it 'gets profile for not_found' do
      username = 'not_found'
      get "/api/v1/users/#{username}"
      body = JSON.parse(response.body)
      expect(response).to have_http_status(401)
      expect(body).to have_key('status')
      expect(body).to have_key('data')
      expect(body).to have_key('msg')
      expect(body['msg']).to eq('Not Found')
    end
  end
end
