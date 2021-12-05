# frozen_string_literal: true

class ListProduct < ApplicationRecord
  belongs_to :list, required: true
  belongs_to :product, required: true
end
