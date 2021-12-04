# frozen_string_literal: true

class Product < ApplicationRecord
  # Associations
  belongs_to :grocery, required: true

  # Validations
  validates :name, presence: true
end
