require "swagger_helper"

RSpec.describe "Api::V1::Users", type: :request do
  path '/api/v1/users/{username}/repositories' do

    get 'Retrieve a repositories' do
      tags 'Repositories'
      produces 'application/json'
      parameter name: :username, :in => :path, :type => :string, :required => true
      parameter name: :search, :in => :query, :type => :string, :required => false
      parameter name: :sincronize, :in => :query, :type => :boolean, :required => false

      response 201, 'Repositories found' do
        schema type: :object,
          properties: {
            error: { type: :boolean },
            msg: { type: :string },
            data: { type: :array,
              items: {
                type: :object,
                properties: {
                  id: {type: :integer},
                  github_id: {type: :integer},
                  user_id: {type: :integer},
                  forks_count: {type: :integer},
                  size: {type: :integer},
                  name: {type: :string},
                  fork: {type: :boolean},
                  private: {type: :boolean},
                  node_id: {type: :string, format: :uuid},
                  language: {type: :string,nullable: true},
                  full_name: {type: :string},
                  git_url: {type: :string},
                  ssh_url: {type: :string},
                  clone_url: {type: :string,format: :uri},
                  svn_url: {type: :string,format: :uri},
                  forks_url: {type: :string,format: :uri},
                  pushed_at: {type: :string,format: 'date-time'},
                  created_at: {type: :string,format: 'date-time'},
                  updated_at: {type: :string,format: 'date-time'}
                }
              }
            },
            details: { type: :string },
            status: { type: :integer }
          },
          required: [ 'data' ]

        let(:username) {'pepe'}
        run_test!
      end

      response '401', 'user not found' do
        let(:username) { 'not_found' }
        run_test!
      end

      response '201', 'user search ruby language' do
        let(:username) { 'pepe' }
        let(:search) { 'ruby' }
        run_test!
      end

      response '201', 'user search not_found' do
        let(:username) { 'pepe' }
        let(:search) { 'not_found' }
        run_test!
      end

    end
  end

  # path "/api/v1/users/{username}" do
  #   get "Get users " do
  #     tags "users"
  #     consumes "application/json"
  #     # parameter name: :username, in: :path, required: true, schema: { type: :string}
  #     parameter name: :username, in: :path, type: :string,required: true
  #   response "201", "encounter created" do
  #       let(:username) {'pepe' }
  #       run_test!
  #     end
  #   response "422", "invalid request" do
  #       let(:username) { 'not_found' }
  #       run_test!
  #     end
  #   end
  # end
end