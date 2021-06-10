require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  
  
 

  
  describe 'GET /new' do
    it 'returns http success' do
      log_in @user
      get '/questions/new'
      expect(response).to have_http_status(:ok)
    end

    it 'ログインしていない場合、ログインページに移動' do
    get '/questions/new' 
    expect(response).to redirect_to '/login'
  end
end
end
