# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repositories, dependent: :destroy
  accepts_nested_attributes_for :repositories, allow_destroy: true
end
