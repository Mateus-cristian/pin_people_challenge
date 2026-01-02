# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  let!(:employee) { Employee.create!(nome: 'Teste', email: 'teste@email.com') }
  let(:valid_attributes) { { nome: 'Novo', email: 'novo@email.com' } }
  let(:invalid_attributes) { { nome: '', email: '' } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns the employee' do
      get :show, params: { id: employee.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(employee.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Employee' do
        expect {
          post :create, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity' do
        post :create, params: { employee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    it 'updates the employee' do
      patch :update, params: { id: employee.id, employee: { nome: 'Atualizado' } }
      expect(response).to be_successful
      expect(employee.reload.nome).to eq('Atualizado')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the employee' do
      expect {
        delete :destroy, params: { id: employee.id }
      }.to change(Employee, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
