# frozen_string_literal: true

# Groceries controller
class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
    json_response(@groceries)
  end

  def create
    @grocery = Grocery.create!(grocery_params)
    json_response(@grocery, :created)
  end

  def show
    @grocery = Grocery.find(params[:id])
    json_response(@grocery)
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    head :no_content if @grocery.destroy
  end

  private

  def grocery_params
    params.permit(:date)
  end
end
