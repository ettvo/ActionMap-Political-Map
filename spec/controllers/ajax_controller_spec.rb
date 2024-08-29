require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #counties' do
    let!(:state) { State.create(symbol: 'CA', name: 'California') }
    let!(:county1) { County.create(name: 'Los Angeles', state: state) }
    let!(:county2) { County.create(name: 'San Francisco', state: state) }

    context 'with valid state symbol' do
      it 'returns a JSON array of counties' do
        get :counties, params: { state_symbol: 'ca' }
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        
        counties = JSON.parse(response.body)
        expect(counties).to be_an(Array)
        expect(counties.length).to eq(2)
        expect(counties).to include('Los Angeles', 'San Francisco')
      end
    end

    context 'with invalid state symbol' do
      it 'returns an empty JSON array' do
        get :counties, params: { state_symbol: 'XX' }
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        
        counties = JSON.parse(response.body)
        expect(counties).to be_an(Array)
        expect(counties).to be_empty
      end
    end

    context 'with missing state symbol' do
      it 'returns a bad request status' do
        get :counties
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end