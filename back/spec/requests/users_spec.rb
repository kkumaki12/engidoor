require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /signup' do
    xit 'returns http success' do
      get '/signup'
      expect(response).to have_http_status(:success)
    end

    xit 'レスポンスコードが200であること' do
      get '/s'
      expect(response).to have_http_status(:ok)
    end
  end

end
