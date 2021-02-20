# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {
    message: lambda do |object, data|
      "Hey #{object.name}, #{data[:value]} is already taken."
    end
  }
  has_many :doses
end
