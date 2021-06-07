require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ユーザー名とメールアドレスとパスワードがある場合、有効である' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'ユーザー名がない場合、無効である' do
    expect(FactoryBot.build(:user, name: '')).to_not be_valid
  end

  it 'メールアドレスがない場合、無効である' do
    expect(FactoryBot.build(:user, email: '')).to_not be_valid
  end

  it 'パスワードが暗号化されている' do
    user = FactoryBot.build(:user)
    expect(user.password_digest).to_not eq 'password' 
  end

  it 'ログイン中のユーザーと一致しない場合、編集ができない' do
    @user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    get edit_user_path, params: {id: @user.id}
    expect(response).redirect_to root
  end
end
