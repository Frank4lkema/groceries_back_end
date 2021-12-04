# frozen_string_literal: true

# lists controller
class ListsController < ApplicationController
  def index
    @lists = List.all
    json_response(@lists)
  end

  def create
    @list = List.create!(list_params)
    json_response(@list, :created)
  end

  def show
    @list = List.find(params[:id])
    json_response(@list)
  end

  def destroy
    @list = List.find(params[:id])
    head :no_content if @list.destroy
  end

  private

  def list_params
    params.permit(:date)
  end
end
