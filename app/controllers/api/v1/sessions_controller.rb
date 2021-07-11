class Api::V1::SessionsController < ApiController

  def log_in
    login_user = User.find(2)
    if login_user != nil
      render plain: login_user.token
    else
      render plain: 'no auth'
    end
  end

  def log_out
    sign_out current_user
    render json: {state: true}
  end

  private
  def user_param
    params.require(:user).permit(:email, :password)
  end
end
