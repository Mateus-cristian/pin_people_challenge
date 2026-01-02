# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Employees', type: :request do
  describe 'GET /api/v1/employees' do
    it 'returns a paginated list of employees' do
      employee = Employee.create!(nome: 'Teste', email: 'teste@empresa.com')
      get '/api/v1/employees'
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json).to be_a(Hash)
      expect(json['employees']).to be_an(Array)
      expect(json['employees'].first['nome']).to eq('Teste')
      expect(json['meta']).to be_a(Hash)
      expect(json['meta']).to have_key('current_page')
      expect(json['meta']).to have_key('total_pages')
      expect(json['meta']).to have_key('total_count')
    end

    it 'returns employees in ascending order' do
      employee1 = Employee.create!(nome: 'Ana', email: 'ana@empresa.com')
      employee2 = Employee.create!(nome: 'Bruno', email: 'bruno@empresa.com')
      get '/api/v1/employees', params: { order: 'asc' }
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['employees'].first['nome']).to eq('Ana')
    end

    it 'returns employees in descending order' do
      employee1 = Employee.create!(nome: 'Ana', email: 'ana@empresa.com')
      employee2 = Employee.create!(nome: 'Bruno', email: 'bruno@empresa.com')
      get '/api/v1/employees', params: { order: 'desc' }
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['employees'].first['nome']).to eq('Bruno')
    end
  end
end
