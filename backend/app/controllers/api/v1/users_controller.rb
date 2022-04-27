# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        response = API_ACTION_NOT_ALLOWED
        api_github = ApiGithub.new
        github_user_response = api_github.get_user(user_params)
        response[:msg] = "Bad credentials"

        unless github_user_response[:error]
          github_user = github_user_response[:data]
          user = User.find_by_github_id(github_user['id'])
          response = API_ACTION_NOT_ALLOWED
          if user.nil?
            github_repos_response = api_github.get_repos(user_params)
            unless github_repos_response[:error]
              repos = github_repos_response[:data]
              puts "repos #{repos}"
              repositories = repos.map do |repo|
                {
                name: repo["name"],
                node_id: repo["node_id"],
                full_name: repo["full_name"],
                html_url: repo["html_url"],
                description: repo["description"],
                fork: repo["fork"],
                private: repo["private"],
                url: repo["url"],
                git_url: repo["git_url"],
                ssh_url: repo["ssh_url"],
                language: repo["language"],
                clone_url: repo["clone_url"],
                svn_url: repo["svn_url"],
                forks_url: repo["forks_url"],
                size: repo["size"],
                forks_count: repo["forks_count"],
                pushed_at: repo["pushed_at"],
              }
            end
            end

            user = User.new({ github_id: github_user['id'], login: github_user['login'], url: github_user['html_url'],avatar_url: github_user['avatar_url'], name: github_user['name'],repositories_attributes: repositories})


            response = ERROR_REGISTRATION_NOT_ALLOWED
            if user.save!
              response = API_SUCCESS_REGISTERED_SUCCESSFULLY
            end
          else
            response = API_SUCCESS_OK
          end
        end
        response[:data] = user
        render json: response, status: response[:status]

      end

      private

      def user_params
        params.require(:username)
      end
    end
  end
end
