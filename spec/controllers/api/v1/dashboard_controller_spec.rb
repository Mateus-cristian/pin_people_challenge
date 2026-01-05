# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DashboardController, type: :controller do
  describe 'GET #show' do
    it 'returns JSON with aggregated dashboard data' do
      emp = create(:employee, area: 'TI', cargo: 'Dev')
      create(:employee_survey_response, employee: emp, feedback: 5, enps: 10)
      get :show, format: :json
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['all']['employees_per_area']['TI']).to eq(1)
      expect(json['all']['enps_distribution']['Promotores (9-10)']).to eq(1)
    end
  end
end
