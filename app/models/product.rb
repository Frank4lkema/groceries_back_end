# frozen_string_literal: true

class Product < ApplicationRecord
  # Associations
  has_many :list_products

  # Validations
  validates :name, presence: true
  validates :standard, presence: true
end
