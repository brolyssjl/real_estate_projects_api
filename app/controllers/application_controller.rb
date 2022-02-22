class ApplicationController < ActionController::API
  rescue_from Exception do |e|
    render json: { message: 'internal_server_error', error: e.message }, status: :internal_server_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { message: 'invalid_record', error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: 'Record not found', error: e.message }, status: :not_found
  end
end
