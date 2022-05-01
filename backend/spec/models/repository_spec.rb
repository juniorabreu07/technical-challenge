require 'rails_helper'

RSpec.describe Repository, type: :model do


  let(:repo) { build(:repo) }
  let(:user) { build(:user) }
  let(:repo_random) { build(:random_repo) }



  before(:each) do

  end


  it 'validar que repositorio no existe' do
    my_repo= Repository.find_by_github_id("qwerty")
    expect(my_repo ).to be_nil
  end


  it "is not valid without a github_id" do
    repo.github_id = nil
    expect(repo).to_not be_valid
  end


  it "is not valid without a name" do
    repo.name = nil
    expect(repo).to_not be_valid
  end

  it "is not valid without a node_id" do
    repo.node_id = nil
    expect(repo).to_not be_valid
  end

  it "is not valid without a full_name" do
    repo.full_name = nil
    expect(repo).to_not be_valid
  end

  it "is not valid without a html_url" do
    repo.html_url = nil
    expect(repo).to_not be_valid
  end

end
