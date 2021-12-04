# frozen_string_literal: true

class Product < ApplicationRecord
  # Associations
  belongs_to :list, required: true

  # Validations
  validates :name, presence: true
end
