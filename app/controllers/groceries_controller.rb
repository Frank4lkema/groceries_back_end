# frozen_string_literal: true

# Groceries controller
class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
    json_response(@groceries)
  end

  def show
    @grocery = Grocery.find(params[:id])
    json_response(@grocery)
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    head :no_content if @grocery.destroy
  end
end
