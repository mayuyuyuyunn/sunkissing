require 'rails_helper'

RSpec.describe 'Sunscreens', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/sunscreens/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/sunscreens/index'
      expect(response).to have_http_status(:success)
    end
  end
end
