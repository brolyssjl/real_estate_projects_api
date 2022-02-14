require 'rails_helper'

RSpec.describe "Healths", type: :request do
  describe "GET /health_check" do
    it "returns http success" do
      get "/health/health_check"
      expect(response).to have_http_status(:success)
    end
  end

end
