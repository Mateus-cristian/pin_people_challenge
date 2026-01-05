# frozen_string_literal: true

module Api
  module V1
    class EmployeeSurveyResponsesController < Api::V1::ApplicationController
      before_action :set_employee

      def index
        responses = @employee.survey_responses.order(created_at: :desc)
        render json: responses
      end

      def create
        response = @employee.survey_responses.new(employee_survey_response_params)
        if response.save
          render json: response, status: :created
        else
          render json: { errors: response.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        response = @employee.survey_responses.find_by(id: params[:id])
        if response.nil?
          render json: { error: 'Resposta não encontrada' }, status: :not_found
        elsif response.update(employee_survey_response_params)
          render json: response, status: :ok
        else
          render json: { errors: response.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_employee
        @employee = Employee.find(params[:employee_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: 'Employee not found', details: e.message }, status: :not_found
      end

      def employee_survey_response_params
        params.require(:employee_survey_response).permit(
          :interesse_no_cargo,
          :comentarios_interesse_no_cargo,
          :contribuicao,
          :comentarios_contribuicao,
          :aprendizado_e_desenvolvimento,
          :comentarios_aprendizado_e_desenvolvimento,
          :feedback,
          :comentarios_feedback,
          :interacao_com_gestor,
          :comentarios_interacao_com_gestor,
          :clareza_sobre_possibilidades_de_carreira,
          :comentarios_clareza_sobre_possibilidades_de_carreira,
          :expectativa_de_permanencia,
          :comentarios_expectativa_de_permanencia,
          :enps,
          :data_da_resposta,
          :aberta_enps
        )
      end
    end
  end
end
