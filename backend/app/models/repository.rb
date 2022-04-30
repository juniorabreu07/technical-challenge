class Repository < ApplicationRecord
  searchkick

  belongs_to :user

  validates_presence_of :github_id
  validates_presence_of :name
  validates_presence_of :node_id
  validates_presence_of :full_name
  validates_presence_of :html_url
end
