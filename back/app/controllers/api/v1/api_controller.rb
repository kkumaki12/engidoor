module Api
  module V1
    class ApiController < ActionController::API
      skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false

      private

      def current_user
        return unless params[:token]
        @current_user ||= User.find_by(params[:token])
      end
    end
  end
end
