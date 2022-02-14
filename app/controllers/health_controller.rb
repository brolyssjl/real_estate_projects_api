class HealthController < ApplicationController
  def health_check
    render json: { 'message': 'the service is app and running :)' }, status: :ok
  end
end
