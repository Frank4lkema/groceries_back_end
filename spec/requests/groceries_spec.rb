# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groceries API', type: :request do
  let!(:groceries) { create_list(:grocery, 10) }
  let(:grocery_id) { groceries.first.id }

  # Test suite for GET /groceries
  describe 'GET /groceries' do
    before { get '/groceries' }

    it 'returns groceries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /groceries/:id
  describe 'GET /groceries/:id' do
    before { get "/groceries/#{grocery_id}" }

    context 'when the record exists' do
      it 'returns the grocery' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(grocery_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:grocery_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Grocery/)
      end
    end
  end

  describe 'POST /groceries' do
    let(:valid_params) { { date: '06-12-2021'.to_date } }

    context 'when request has valid params' do
      before { post '/groceries', params: valid_params }
      it 'expected to create a new grocery-list' do
        expect(json['date']).to eq('2021-12-06')
      end

      it 'expect to have code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request has invalid params' do
      let(:invalid_params) { { date: nil } }
      before { post '/groceries', params: invalid_params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Date can't be blank/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /groceries/:id' do
    before { delete "/groceries/#{grocery_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
