class ListProductsController < ApplicationController
  def index
    list = List.find(params[:list_id])
    json_response(list.list_products)
  end
end