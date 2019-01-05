class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :handle_error

    include Knock::Authenticable

    private

    def handle_error(e)
      render json: { error: e.to_s }, status: :bad_request
    end
end
