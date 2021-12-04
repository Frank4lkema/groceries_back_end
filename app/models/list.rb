# frozen_string_literal: true

class List < ApplicationRecord
  # Associations
  has_many :products, dependent: :destroy

  # Validations
  validates :date, presence: true
end
