
# frozen_string_literal: true

require 'swagger_helper'
describe 'Employee Survey Responses API' do
  path '/api/v1/employees/{employee_id}/employee_survey_responses' do
    parameter name: :employee_id, in: :path, type: :string, description: 'ID do colaborador'

    get 'Lista todas as respostas de pesquisa do colaborador' do
      tags 'Respostas de Pesquisa'
      produces 'application/json'
      response '200', 'respostas encontradas' do
        schema type: :array, items: { '$ref' => '#/components/schemas/employee_survey_response' }
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        run_test!
      end
      response '404', 'colaborador não encontrado' do
        let(:employee_id) { 'invalid' }
        run_test!
      end
    end

    post 'Cria uma resposta de pesquisa para o colaborador' do
      tags 'Respostas de Pesquisa'
      consumes 'application/json'
      parameter name: :employee_survey_response, in: :body, schema: {
        type: :object,
        properties: {
          interesse_no_cargo: { type: :integer },
          comentarios_interesse_no_cargo: { type: :string },
          contribuicao: { type: :integer },
          comentarios_contribuicao: { type: :string },
          aprendizado_e_desenvolvimento: { type: :integer },
          comentarios_aprendizado_e_desenvolvimento: { type: :string },
          feedback: { type: :integer },
          comentarios_feedback: { type: :string },
          interacao_com_gestor: { type: :integer },
          comentarios_interacao_com_gestor: { type: :string },
          clareza_sobre_possibilidades_de_carreira: { type: :integer },
          comentarios_clareza_sobre_possibilidades_de_carreira: { type: :string },
          expectativa_de_permanencia: { type: :integer },
          comentarios_expectativa_de_permanencia: { type: :string },
          enps: { type: :integer },
          aberta_enps: { type: :string },
          data_da_resposta: { type: :string, format: :date }
        },
        required: [ 'interesse_no_cargo', 'data_da_resposta' ]
      }
      response '201', 'resposta criada' do
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:employee_survey_response) { {
          interesse_no_cargo: 8,
          comentarios_interesse_no_cargo: 'Comentário interesse',
          contribuicao: 7,
          comentarios_contribuicao: 'Comentário contribuição',
          aprendizado_e_desenvolvimento: 9,
          comentarios_aprendizado_e_desenvolvimento: 'Comentário aprendizado',
          feedback: 10,
          comentarios_feedback: 'Comentário feedback',
          interacao_com_gestor: 8,
          comentarios_interacao_com_gestor: 'Comentário gestor',
          clareza_sobre_possibilidades_de_carreira: 7,
          comentarios_clareza_sobre_possibilidades_de_carreira: 'Comentário clareza',
          expectativa_de_permanencia: 8,
          comentarios_expectativa_de_permanencia: 'Comentário permanência',
          enps: 9,
          aberta_enps: 'Ambiente excelente',
          data_da_resposta: Date.today.to_s
        }}
        run_test!
      end
      response '422', 'dados inválidos' do
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:employee_survey_response) { { interesse_no_cargo: nil } }
        run_test!
      end
    end
  end

  path '/api/v1/employees/{employee_id}/employee_survey_responses/{id}' do
    parameter name: :employee_id, in: :path, type: :string, description: 'ID do colaborador'
    parameter name: :id, in: :path, type: :string, description: 'ID da resposta de pesquisa'

    put 'Atualiza uma resposta de pesquisa do colaborador' do
      tags 'Respostas de Pesquisa'
      consumes 'application/json'
      parameter name: :employee_survey_response, in: :body, schema: {
        type: :object,
        properties: {
          interesse_no_cargo: { type: :integer },
          comentarios_interesse_no_cargo: { type: :string },
          contribuicao: { type: :integer },
          comentarios_contribuicao: { type: :string },
          aprendizado_e_desenvolvimento: { type: :integer },
          comentarios_aprendizado_e_desenvolvimento: { type: :string },
          feedback: { type: :integer },
          comentarios_feedback: { type: :string },
          interacao_com_gestor: { type: :integer },
          comentarios_interacao_com_gestor: { type: :string },
          clareza_sobre_possibilidades_de_carreira: { type: :integer },
          comentarios_clareza_sobre_possibilidades_de_carreira: { type: :string },
          expectativa_de_permanencia: { type: :integer },
          comentarios_expectativa_de_permanencia: { type: :string },
          enps: { type: :integer },
          aberta_enps: { type: :string },
          data_da_resposta: { type: :string, format: :date }
        },
        required: [ 'interesse_no_cargo', 'data_da_resposta' ]
      }
      response '200', 'resposta atualizada' do
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:id) { EmployeeSurveyResponse.create!(employee_id: employee_id, interesse_no_cargo: 8, data_da_resposta: Date.today).id }
        let(:employee_survey_response) { {
          interesse_no_cargo: 9,
          comentarios_interesse_no_cargo: 'Atualizado',
          data_da_resposta: Date.today.to_s
        }}
        run_test!
      end
      response '404', 'resposta não encontrada' do
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:id) { 'invalid' }
        let(:employee_survey_response) { { interesse_no_cargo: 9, data_da_resposta: Date.today.to_s } }
        run_test!
      end
      response '422', 'dados inválidos' do
        let(:employee_id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:id) { EmployeeSurveyResponse.create!(employee_id: employee_id, interesse_no_cargo: 8, data_da_resposta: Date.today).id }
        let(:employee_survey_response) { { interesse_no_cargo: nil, data_da_resposta: Date.today.to_s } }
        run_test!
      end
    end
  end
end
