# frozen_string_literal: true

class ProductsController < ApplicationController
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  private

  def product_params
    params.permit(:name, :standard)
  end
end
