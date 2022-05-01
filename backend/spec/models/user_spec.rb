# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user_random) { build(:random_user) }
  let(:user) { build(:user) }
  let(:repo) { build(:random_repo) }



  before(:each) do
    @user_global = build(:random_user)
    @user_global.save!
  end

  it 'validar que se registre un nuevo usuario' do
    expect(user_random.save!).to eq(true)
  end

  it 'validar que usuario no tiene repositorio' do
    repositories = user_random.prepare_repositories([])
    expect(repositories.size).to eq(0)
  end

  it 'validar que usuario tiene por lo menos un repositorio' do
    repositories = user_random.prepare_repositories([repo])
    expect(repositories.size).to eq(1)
  end

  it 'validar que usuario existe' do
    user.save!
    my_user= User.find_by_login(user.login)
    expect(my_user ).to be
  end

  it 'validar que usuario no existe' do
    my_user= User.find_by_login("qwerty")
    expect(my_user ).to be_nil
  end


  it "is not valid without a github_id" do
    user.github_id = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a login" do
    user.login = nil
    expect(user).to_not be_valid
  end



end
