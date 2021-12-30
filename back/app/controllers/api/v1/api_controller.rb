module Api
  module V1
    class ApiController < ActionController::API
      skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false
    end
  end
end
