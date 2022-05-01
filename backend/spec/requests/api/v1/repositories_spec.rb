# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Repositories', type: :request do
  let(:user) { build(:user) }
  let(:repo) { build(:random_repo) }
  before(:each) do
    username = 'pepe'
    get "/api/v1/users/#{username}/repositories"
  end
  it 'gets respositories for pepe' do
    username = 'pepe'
    get "/api/v1/users/#{username}/repositories"
    body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(body).to have_key('status')
    expect(body).to have_key('data')
    expect(body).to have_key('msg')
    expect(body['data'].class.to_s).to eq('Array')
  end

  it 'gets respositories for pepe and sincronize' do
    username = 'pepe'
    get "/api/v1/users/#{username}/repositories?sincronize=true"
    body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(body).to have_key('status')
    expect(body).to have_key('data')
    expect(body).to have_key('msg')
    expect(body['data'].class.to_s).to eq('Array')
  end


  it 'gets respositories for pepe and search repositories language ruby' do
    username = 'pepe'
    get "/api/v1/users/#{username}/repositories?search=ruby"
    body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(body).to have_key('status')
    expect(body).to have_key('data')
    expect(body).to have_key('msg')
    repositories = body['data']
    expect(repositories.class.to_s).to eq('Array')
    expect(repositories.size > 0).to eq(true)
    expect(repositories.first['language'].to_s.downcase).to eq('ruby')
  end
end
