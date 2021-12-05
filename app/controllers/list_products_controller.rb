# frozen_string_literal: true

class ListProductsController < ApplicationController
  def index
    list = List.find(params[:list_id])
    json_response(list.list_products)
  end

  def create
    list_product = ListProduct.create!(list_product_params)
    json_response(list_product,:created)
  end

  private

  def list_product_params
    params.permit(:amount, :product_id, :list_id)
  end
end
