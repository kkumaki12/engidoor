class Api::V1::ApiController < ActionController::API
  skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false

  include SessionsHelper

end
