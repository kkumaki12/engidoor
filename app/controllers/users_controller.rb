class UsersController < ApplicationController
skip_before_action :verify_authenticity_token
 before_action :logged_in_user, only: [:edit, :update]
 before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
    pp @user = User.find(params[:id])
    if pp @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if 
      @user.save
      log_in @user
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to @user
    else
      render 'new'
    end


  end

private
def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
end

def logged_in_user
  unless logged_in?
    flash[:danger] = "ログインしてください"
    redirect_to login_url
end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless current_user == @user
end
end



