class ApplicationController < ActionController::API
  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  def resource_not_found
    render json: 'Record not found', status: :not_found
  end
end
