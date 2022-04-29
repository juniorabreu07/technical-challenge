

class ApiGithub

  def initialize()
    @connection = nil
    @host = "https://api.github.com"
    config_request_github()
  end

  def get_user(username)
    response_request = @connection.get("#{@host}/users/#{username}")
    config_response_github(response_request)
  end

  def get_repos(username)
    response_request = @connection.get("#{@host}/users/#{username}/repos?per_page=100&sort=updated")
    config_response_github(response_request)
  end


  private

  def config_request_github
    @connection = Faraday.new do |f|
      f.request :authorization, 'Bearer',  Figaro.env.GITHUB_TOKEN
      f.request :json # encode req bodies as JSON
      f.request :retry # retry transient failures
      f.response :follow_redirects # follow redirects
      f.response :json # decode response bodies as JSON
    end
  end

  def config_response_github( response_request )
    body = response_request.body
    reponse = {error: true, data: body, msg: "error getting api" }
    reponse[:error] = response_request.status.to_i != 200
    if reponse[:error] && ! body['message'].nil?
      reponse[:msg] = body['message']
    end
    reponse
  end

end