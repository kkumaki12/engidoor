require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'POST #create' do
        context '正しいユーザー情報が渡ってきた場合' do
            let(:params) do
                {user: {
                    name: 'hogehoge',
                    email: 'hoge@hoge.com',
                    password: 'password',
                    password_confirmation: 'password',
                }
            }
            end

            it 'ユーザーが一人増えていること' do
                expect{post :create, params: params}.to change(User, :count).by(1)
            end

        end
    end
end