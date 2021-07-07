class Api::V1::SessionsController < ApiController



  def log_out
    sign_out current_user
    render json: {state: true}
  end

  def create
    user = User.find_by(email: params[:session][:email])
    
    if user&.authenticate(params[:session][:password])
      log_in user
      render json: {state: true}
    else
      render json: {state: false}
    end
  end


  def destroy
    log_out
    redirect_to root_path
  end

  private
  def user_param
    params.permit(:email, :password)
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end

