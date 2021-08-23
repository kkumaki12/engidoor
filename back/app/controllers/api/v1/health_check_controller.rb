module Api
  module V1
    class HealthCheckController < ApiController
      def index
        head 200
      end
    end
  end
end
