# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Dashboard', type: :request do
  it 'returns aggregated dashboard data' do
    emp = Employee.create!(nome: 'João', email: 'joao@empresa.com', area: 'TI', cargo: 'Dev')
    EmployeeSurveyResponse.create!(employee: emp, feedback: 5, enps: 10, interesse_no_cargo: 7)
    get '/api/v1/dashboard', as: :json
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json['all']).to be_a(Hash)
    expect(json['all']['employees_per_area']['TI']).to eq(1)
    expect(json['all']['enps_distribution']['Promotores (9-10)']).to eq(1)
  end
end
