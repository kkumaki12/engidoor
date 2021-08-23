module Api
  module V1
    class SessionsController < ApiController
      def log_in
        login_user = User.find_by(email: params[:user][:email])
        if !login_user.nil? && login_user.authenticate(params[:user][:password])
          render json: login_user
        else
          render status: :internal_server_error
        end
      end

      def log_out
        sign_out current_user
        render json: { state: true }
      end

      private

      def user_param
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
