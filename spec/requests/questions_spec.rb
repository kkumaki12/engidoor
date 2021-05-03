require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      current_user
      get '/questions/new'
      expect(response).to have_http_status(:success)
    end
  end

end
