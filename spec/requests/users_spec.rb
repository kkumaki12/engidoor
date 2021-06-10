require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /signup' do
    it 'returns http success' do
      get '/signup'
      expect(response).to have_http_status(:success)
    end

    it 'レスポンスコードが200であること' do
      get '/signup'
      expect(response).to have_http_status(:ok)
    end

        it 'newテンプレートをレンダリングすること' do
          get '/signup'
      expect(response).to render_template :new
    end

    it "正しいユーザー情報で登録した場合" do
      get signup_path
      expect {
        post users_path, params: { user: { name:  "Example User",
                                           email: "user@example.com",
                                           password:              "password",
                                           password_confirmation: "password" } }
      }.to change(User, :count).by(1)
      redirect_to root_path
    end
  end

end
