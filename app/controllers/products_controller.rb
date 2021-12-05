# frozen_string_literal: true

class ProductsController < ApplicationController
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  def update
    @product = Product.find(params[:id])
    head :no_content if @product.update!(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    head :no_content if @product.destroy
  end

  private

  def product_params
    params.permit(:name, :standard)
  end
end
