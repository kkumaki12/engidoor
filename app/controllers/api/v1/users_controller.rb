class Api::V1::UsersController < ApiController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end


  def show
    user = User.find(params[:id])
    render json: user
   
    end


  def create
    user = User.new(user_params)
    if user.save!
      log_in user
      render json: user, status: created
    else
      render json: { message: '登録できませんでした'}
    end
  end

  def ranking 
    join = User.joins({comments: :goods})
    table = join.group(:id).order('count(users.id) desc').pluck(:id)
    rank = User.find(table)
    render json:rank
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :occupation, :specialty)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end




