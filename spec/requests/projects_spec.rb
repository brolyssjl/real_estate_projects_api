require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  # initialize test data
  let(:project_id) { 1 }

  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /projects' do
    before { get '/projects' }

    context 'when exist projects' do
      it 'returns a non empty response' do
        expect(response.body).not_to be_empty
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /projects/:project_id' do
    before { get "/projects/#{project_id}" }

    context 'project found' do
      it 'return project data' do
        expect(response.body).not_to be_empty
        project = JSON.parse(response.body)
        expect(project['id']).to equal(project_id)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'project not found' do
      let(:project_id) { 100 }

      it 'returns http not found' do
        get '/projects/100'
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
