# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List products API', type: :request do
  let(:list) { create(:list) }
  let(:product) { create(:product) }
  let!(:product_list) { create(:list_product, list: list, product: product, amount: 1) }

  # Test suite for GET /list_products/:id
  describe 'GET /lists/:id/products' do
    context 'when the list exists' do
      before { get "/lists/#{list.id}/products" }
      it 'returns the list of products' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:list_id) { 100 }
      before { get "/lists/#{list_id}/products" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  # describe 'POST /lists' do
  #   let(:valid_params) { { date: '06-12-2021'.to_date } }
  #
  #   context 'when request has valid params' do
  #     before { post '/lists', params: valid_params }
  #     it 'expected to create a new list-list' do
  #       expect(json['date']).to eq('2021-12-06')
  #     end
  #
  #     it 'expect to have code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end
  #
  #   context 'when request has invalid params' do
  #     let(:invalid_params) { { date: nil } }
  #     before { post '/lists', params: invalid_params }
  #
  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end
  #
  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Date can't be blank/)
  #     end
  #   end
  # end
  #
  # # Test suite for DELETE /todos/:id
  # describe 'DELETE /lists/:id' do
  #   before { delete "/lists/#{list_id}" }
  #
  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
