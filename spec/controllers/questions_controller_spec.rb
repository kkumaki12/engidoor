require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    describe 'POST #create' do
        context '正しい質問情報が渡ってきた場合' do
            let(:params) do
                {question: {
                    title: 'タイトル',
                    content: '質問内容'
                }
            }
            end

            xit '質問が一件増えていること' do
                expect{post :create, params: params}.to change(Question, :count).by(1)
            end

        end
    end
    end