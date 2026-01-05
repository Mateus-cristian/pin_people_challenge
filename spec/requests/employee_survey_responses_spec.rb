# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "EmployeeSurveyResponses API", type: :request do
  let!(:employee) { Employee.create!(nome: 'João', email: 'joao@empresa.com') }

  describe "POST /employees/:employee_id/employee_survey_responses" do
    let(:valid_params) do
      {
        employee_survey_response: {
          interesse_no_cargo: 8,
          contribuicao: 7,
          aprendizado_e_desenvolvimento: 9,
          feedback: 10,
          interacao_com_gestor: 8,
          clareza_sobre_possibilidades_de_carreira: 7,
          expectativa_de_permanencia: 8,
          enps: 9,
          data_da_resposta: Date.today
        }
      }
    end

    it "creates a survey response for the employee" do
      post "/api/v1/employees/#{employee.id}/employee_survey_responses", params: valid_params
      expect(response).to have_http_status(:created)
      expect(EmployeeSurveyResponse.last.feedback).to eq(10)
      expect(EmployeeSurveyResponse.last.employee).to eq(employee)
    end

    it "returns errors for invalid data" do
      post "/api/v1/employees/#{employee.id}/employee_survey_responses", params: { employee_survey_response: { feedback: 99 } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)["errors"]).to be_present
    end
  end
end
