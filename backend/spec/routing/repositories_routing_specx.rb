require "rails_helper"

RSpec.describe Api::V1::RepositoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/users/pepe/repositories").to route_to("repositories#index")
    end

  end
end
