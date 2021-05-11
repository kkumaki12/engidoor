class ApplicationPagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home
    @questions = Question.page(params[:page]).per(7)
    @tags = Tag.all
    join = User.joins({comments: :goods})
    table = join.group(:id).order('count(users.id) desc').pluck(:id)
    @rank = User.find(table)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
    log_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
