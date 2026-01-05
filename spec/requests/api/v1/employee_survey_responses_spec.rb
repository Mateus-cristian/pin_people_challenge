# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::EmployeeSurveyResponses", type: :request do
  let(:employee) { FactoryBot.create(:employee) }
  let!(:responses) { FactoryBot.create_list(:employee_survey_response, 3, employee: employee, interesse_no_cargo: 5, comentarios_feedback: "Ótimo ambiente", comentarios_interesse_no_cargo: "Quero crescer") }

  describe "GET /api/v1/employees/:employee_id/employee_survey_responses" do
    it "returns all survey responses for the employee" do
      get api_v1_employee_employee_survey_responses_path(employee_id: employee.id)
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
      expect(json.first).to include("id", "interesse_no_cargo", "enps", "comentarios_feedback", "comentarios_interesse_no_cargo")
    end
  end

  describe "POST /api/v1/employees/:employee_id/employee_survey_responses" do
    let(:valid_params) do
      {
        employee_survey_response: {
          interesse_no_cargo: 4,
          comentarios_interesse_no_cargo: "Comentário interesse",
          contribuicao: 5,
          comentarios_contribuicao: "Comentário contribuição",
          aprendizado_e_desenvolvimento: 3,
          comentarios_aprendizado_e_desenvolvimento: "Comentário aprendizado",
          feedback: 4,
          comentarios_feedback: "Comentário feedback",
          interacao_com_gestor: 5,
          comentarios_interacao_com_gestor: "Comentário gestor",
          clareza_sobre_possibilidades_de_carreira: 4,
          comentarios_clareza_sobre_possibilidades_de_carreira: "Comentário clareza",
          expectativa_de_permanencia: 3,
          comentarios_expectativa_de_permanencia: "Comentário permanência",
          enps: 8,
          data_da_resposta: Date.today
        }
      }
    end

    it "creates a new survey response" do
      expect {
        post api_v1_employee_employee_survey_responses_path(employee_id: employee.id), params: valid_params
      }.to change(EmployeeSurveyResponse, :count).by(1)
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["interesse_no_cargo"]).to eq(4)
      expect(json["comentarios_feedback"]).to eq("Comentário feedback")
      expect(json["comentarios_interesse_no_cargo"]).to eq("Comentário interesse")
    end

    it "returns errors for invalid params" do
      post api_v1_employee_employee_survey_responses_path(employee_id: employee.id), params: { employee_survey_response: { interesse_no_cargo: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["errors"]).to be_present
    end
  end
end
