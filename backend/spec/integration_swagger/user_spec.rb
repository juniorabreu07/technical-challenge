require "swagger_helper"


RSpec.describe "Api::V1::Users", type: :request do
  path '/api/v1/users/{username}' do

    get 'Retrieve a User' do
      tags 'Users'
      produces 'application/json'
      parameter name: :username, :in => :path, :type => :string

      response 201, 'Users found' do
        schema type: :object,
          properties: {
            error: { type: :boolean },
            msg: { type: :string },
            data: { type: :object,
              properties: {
                id: {type: :integer},
                github_id: {type: :integer},
                login: {type: :string},
                url: {type: :string,format: :uri},
                name: {type: :string},
                email: {type: :string,format: :email},
                avatar_url: {type: :string,format: :uri},
                created_at: {type: :string,format: 'date-time'},
                updated_at: {type: :string,format: 'date-time'}
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

    end
  end

end