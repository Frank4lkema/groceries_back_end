# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  describe 'POST /products' do
    let(:valid_params) { { name: 'Milk', standard: true } }

    context 'when request has valid params' do
      before { post '/products', params: valid_params }
      it 'expected to create a new product' do
        expect(json['name']).to eq('Milk')
        expect(json['standard']).to eq(true)
      end

      it 'expect to have code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request has invalid params' do
      let(:invalid_params) { { name: 'Milk' } }
      before { post '/products', params: invalid_params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Standard can't be blank/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  # describe 'DELETE /lists/:id' do
  #   before { delete "/lists/#{list_id}" }
  #
  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
