require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

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

  it 'メールアドレスが255文字で有効' do
    expect(FactoryBot.build(:user, email: "#{'a' * 243}@example.com")).to be_valid
  end

  it 'メールアドレスが256文字で無効' do
    user.email = "#{'a' * 244}@example.com"
    user.valid?
    expect(user.errors[:email]).to include("は255文字以内で入力してください")
  end

  it 'パスワードが6文字で有効' do
    expect(FactoryBot.build(:user, password: 'a' * 6)).to be_valid
  end

  it 'パスワードが5文字で無効' do
    user.password = 'a' * 5
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  
end

