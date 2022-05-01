# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { 'juniorabreu07' }
    id { '8' }
    github_id { '3434348' }
    url { 'http://test.com' }
    name { 'Junior Abreu' }
    email { 'juniorabreu201@gamil.com' }
    avatar_url { 'http://test.com' }
  end

  factory :random_user, class: User do
    login {Faker::Internet.username}
    github_id {Faker::Number.number(digits: 10) }
    name {Faker::Company.name}
    email {Faker::Internet.email(domain: 'gmail')}
    url {Faker::Internet.url}
    avatar_url {Faker::Internet.url}
    repositories {[]}
  end
end
