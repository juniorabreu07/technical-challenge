FactoryBot.define do

  factory :repo, class: Repository do
    name {"test"}
    html_url {"http://test.com"}
    description {"test"}
    node_id {"Faker::IDNumber.croatian_id(international: true)"}
    github_id {"MDEwOlJlcG9zaXRvcnkxMjA2Nzk"}
    full_name {"test"}
  end
  factory :random_repo, class: Repository do
    name {Faker::Company.name}
    html_url {Faker::Internet.url}
    description {Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)}
    node_id {Faker::IDNumber.croatian_id(international: true)}
    github_id {Faker::Number.number(digits: 10) }
    full_name {Faker::File.dir }
  end
end

