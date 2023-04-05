# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :controller do
  SECRET_KEY = '3bd3f88fbf7b745f714fb1bea85d4a7f747009b160bb303f36497d88a3dd765b'.freeze

#   routes { Core::Engine.routes }
  let!(:project) { create :project }
  let!(:user) { create :user }

  before do
    @valid_user_token = JWT.encode({user_id: project.user.id}, SECRET_KEY)

    @invalid_user_token = JWT.encode({user_id: user.id}, SECRET_KEY)
  end

  describe 'GET #index' do
    it 'shows all the projects' do
      get 'index', format: :json
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'shows specific project' do
      get 'show', params: {id: project.id}, format: :json
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    subject do
      params = {
        title: 'Test Title', 
        description: 'Test Description', 
        type: 'in_house', 
        location: 'USA', 
        format: 'json'
      }
      
      post :create, params: params
      response
    end

    context 'when logged in creates the project' do
      it 'returns created status' do
        request.headers.merge!({'Authorization' => "Bearer #{@valid_user_token}"})
        expect(subject).to have_http_status(201)
      end
    end

    context 'when non-logged in creates the project' do
      it 'returns error message to login' do
        expect(JSON.parse(subject.body)['message']).to match(/log in/i)
      end
    end
  end

  describe 'PATCH #update' do
    subject do
      params = {id: project.id,
        title: 'Updated Test Title',
        format: 'json'}
      patch :update, params: params
    end

    context 'when authorized user tries to update the project' do
      it 'updates the project successfully' do
        request.headers.merge!({'Authorization' => "Bearer #{@valid_user_token}"})
        expect(subject).to have_http_status(200)
        expect(project.reload.title).to eq('Updated Test Title')
      end
    end

    context 'when unauthorized user tries to update the project' do
      it 'returns error message' do
        request.headers.merge!({'Authorization' => "Bearer #{@invalid_user_token}"})
        expect(JSON.parse(subject.body)['message']).to match(/not authorized/i)
      end
    end

    context 'when non-logged in updates the project' do
      it 'returns error message to login' do
        expect(JSON.parse(subject.body)['message']).to match(/log in/i)
      end
    end
  end

  describe 'POST #destroy' do
    subject do
      params = {
        id: project.id, 
        format: 'json'
      }
      
      post :destroy, params: params
      response
    end

    context 'when authorized user destroys the project' do
      it 'returns deleted message' do
        request.headers.merge!({'Authorization' => "Bearer #{@valid_user_token}"})
        expect(JSON.parse(subject.body)['message']).to match(/Deleted/i)
      end
    end

    context 'when unauthorized user tries to destroy the project' do
      it 'returns error message' do
        request.headers.merge!({'Authorization' => "Bearer #{@invalid_user_token}"})
        expect(JSON.parse(subject.body)['message']).to match(/not authorized/i)
      end
    end

    context 'when non-logged in destroys the project' do
      it 'returns error message to login' do
        expect(JSON.parse(subject.body)['message']).to match(/log in/i)
      end
    end
  end


  describe 'GET #my_projects' do
    context 'when logged in shows my project' do
      it 'returns all the users project' do
        request.headers.merge!({'Authorization' => "Bearer #{@valid_user_token}"})
        get 'my_projects', format: :json
        expect(response).to have_http_status(200)
      end
    end

    context 'when non-logged in shows my project' do
      it 'returns error message to login' do
        get 'my_projects', format: :json
        expect(JSON.parse(response.body)['message']).to match(/log in/i)
      end
    end
  end
end
