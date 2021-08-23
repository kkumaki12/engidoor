require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:question) { FactoryBot.build(:question, user_id: user.id) }

    it '正常に投稿できること' do
      expect(question).to be_valid
    end

    context 'タイトル' do
      it 'タイトルがなければ投稿できないこと' do
        question.title = nil
        expect(question).to be_invalid
        expect(question.save).to be_falsey
      end

      it 'タイトルが30文字なら登録できること' do
        question.title = 'a' * 30
        expect(question).to be_valid
      end

      it 'タイトルが31文字なら登録できないこと' do
        question.title = 'a' * 31
        expect(question).to be_invalid
        expect(question.save).to be_falsey
      end
    end
    context '内容' do
      it '内容がなければ登録できないこと' do
        question.content = nil
        expect(question).to be_invalid
        expect(question.save).to be_falsey
      end

      it '内容が2000文字なら登録できること' do
        question.content = 'a' * 2000
        expect(question).to be_valid
      end
      it '内容が2001文字なら登録できないこと' do
        question.content = 'a' * 2001
        expect(question).to be_invalid
        expect(question.save).to be_falsey
      end
    end
  end
end
