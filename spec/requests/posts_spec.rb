require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'controller return correct data' do
      get('/users/:id/posts')
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Display all posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'controller return correct data' do
      get('/users/:user_id/posts/:id')
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('Post Details')
    end
  end
end
