require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'controller return correct data' do
      get('/users')
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET /users/:user_id' do
    it 'controller return correct data' do
      get('/users/:user_id')
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('Users Details')
    end
  end
end
