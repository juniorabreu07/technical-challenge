# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repositories, dependent: :destroy
  accepts_nested_attributes_for :repositories, allow_destroy: true

  def self.validated_and_create_or_update( username )
    response = API_ACTION_NOT_ALLOWED
    unless username.blank?
      api_github = ApiGithub.new
      user = User.find_by_login(username)

      if user.nil?
        github_user_response = api_github.get_user(username)
        response[:msg] = github_user_response[:msg]
        unless github_user_response[:error]
          github_user = github_user_response[:data]
          response = API_ACTION_NOT_ALLOWED
        end
      else
        response = API_SUCCESS_OK
        response[:data] = user
      end

      if !user.nil? || !github_user_response[:error]
        github_repos_response = api_github.get_repos(username)
        unless github_repos_response[:error]
          repos = github_repos_response[:data]
          response = self.create_or_update_user_with_repositories(github_user, repos, user)
        end
      end
    else
      response[:detail] = "Username is required"
    end
    response
  end


  def self.create_or_update_user_with_repositories( github_user, repos, user)
    isUpdate = !user.nil?
    response = {error: true, msg: ERROR_REGISTRATION_NOT_ALLOWED, data: nil,status: 401}

    unless isUpdate
      user = User.new({ github_id: github_user['id'], login: github_user['login'],email: github_user['email'] , url: github_user['html_url'],avatar_url: github_user['avatar_url'], name: github_user['name']})
    end

    user.prepare_repositories(repos)

    response[:error] = ! user.save!

    unless response[:error]
      response[:msg] = isUpdate ? SUCCESS_RECORD_UPDATED_SUCCESSFULLY : SUCCESS_REGISTERED_SUCCESSFULLY
      response[:status] = 201
      response[:data] = user
    end
    response
  end

  def prepare_repositories(repos)
    data = self.id.nil? ? [] : self.repositories
    repositories = repos.map do |repo|
      repoTem = data.select {|item| repo['id'] == item["github_id"]}.last
      newRepo = {
        github_id: repo['id'], name: repo["name"], node_id: repo["node_id"], full_name: repo["full_name"],
        html_url: repo["html_url"],description: repo["description"], fork: repo["fork"], private: repo["private"], url: repo["url"],
        git_url: repo["git_url"],ssh_url: repo["ssh_url"], language: repo["language"], clone_url: repo["clone_url"],svn_url: repo["svn_url"],
        forks_url: repo["forks_url"], size: repo["size"], forks_count: repo["forks_count"], pushed_at: repo["pushed_at"],
      }
      self.id.nil? || repoTem.nil? ?  Repository.new(newRepo) : repoTem
    end

    self.repositories = repositories
  end

end
