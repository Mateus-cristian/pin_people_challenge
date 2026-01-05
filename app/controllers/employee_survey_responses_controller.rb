# frozen_string_literal: true

class EmployeeSurveyResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    response = employee.survey_responses.new(employee_survey_response_params)
    if response.save
      render json: response, status: :created
    else
      render json: { errors: response.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def employee_survey_response_params
    params.require(:employee_survey_response).permit(
      :interesse_no_cargo,
      :contribuicao,
      :aprendizado_e_desenvolvimento,
      :feedback,
      :interacao_com_gestor,
      :clareza_sobre_possibilidades_de_carreira,
      :expectativa_de_permanencia,
      :enps,
      :data_da_resposta
    )
  end
end
