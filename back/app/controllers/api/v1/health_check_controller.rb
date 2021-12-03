module Api
  module V1
    class HealthCheckController < ApiController
      def index
        head :ok
      end
    end
  end
end
