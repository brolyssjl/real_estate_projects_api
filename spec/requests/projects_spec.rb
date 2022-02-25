require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  # initialize test data
  let(:project_id) { 1 }
  let(:payload) do
    {
      project: {
        name: 'Altos del camino',
        country: 'Colombia',
        city: 'Bogotá',
        neighborhood: 'Orquideas',
        address: 'Calle 127 # 74-25',
        phone: '3124567890',
        description: 'Proyecto donde encontraras todo lo que necesitas',
        stratum: 4,
        sales_room_address: 'Calle 100 # 40 - 53',
        sales_room_phone: '3153947865 - 3213459876',
        sales_room_email: 'altos_ventas@mailinator.com',
        estimated_start_date: '2022-05-20',
        estimated_end_date: '2026-05-20'
      }
    }
  end

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
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /projects' do
    before { post '/projects', params: payload }

    context 'project successfully created' do
      it 'returns project data' do
        res = JSON.parse(response.body)
        expect(res).not_to be_empty
        expect(res['id']).not_to be_nil
        expect(res['id']).to be > 0
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'project create unprocessable entity' do
      let(:payload) do
        {
          project: {
            name: ''
          }
        }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'project server error' do
      let(:payload) do
        {
          x: ''
        }
      end

      it 'returns http internal server error' do
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end

  describe 'PUT /projects/:id' do
    before { put "/projects/#{project_id}", params: payload }

    context 'project successfully updated' do
      it 'returns project data' do
        res = JSON.parse(response.body)
        expect(res).not_to be_empty
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'project not found to update' do
      let(:project_id) { 555 }

      it 'returns http not found' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'project update unprocessable entity' do
      let(:payload) do
        {
          project: {
            name: ''
          }
        }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'project update internal server error' do
      let(:payload) do
        {
          post: {
            title: 'No idea'
          }
        }
      end

      it 'returns http internal server error' do
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end

  describe 'DELETE /projects/:id' do
    before { delete "/projects/#{project_id}" }

    context 'project successfully deleted' do
      it 'returns project id' do
        res = JSON.parse(response.body)
        expect(response).not_to be_nil
        expect(res['message']).not_to be_empty
      end

      it 'return http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'project to delete not found' do
      let(:project_id) { 600 }

      it 'returns not found' do
        expect(response).to have_http_status(:not_found) 
      end
    end
  end
end
