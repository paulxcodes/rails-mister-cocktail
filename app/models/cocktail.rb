# frozen_string_literal: true

class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: {
    message: lambda do |object, data|
      "Hey #{object.name}, #{data[:value]} is already taken."
    end
  }
  has_many :ingredients, through: :doses
end
