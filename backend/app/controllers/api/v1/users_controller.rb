# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        response = API_ACTION_NOT_ALLOWED
        api_github = ApiGithub.new
        user = User.find_by_login(user_params)

        if user.nil?
          github_user_response = api_github.get_user(user_params)
          unless github_user_response[:error]
            github_user = github_user_response[:data]
            response = API_ACTION_NOT_ALLOWED
          end
        else
          response = API_SUCCESS_OK
          response[:data] = user
        end

        if !user.nil? || !github_user_response[:error]
          github_repos_response = api_github.get_repos(user_params)
          unless github_repos_response[:error]
            repos = github_repos_response[:data]
            response = User.create_or_update_user_with_repositories(github_user, repos, user)
          end
        end

        render json: response, status: response[:status]

      end

      private

      def user_params
        params.require(:username)
      end
    end
  end
end
