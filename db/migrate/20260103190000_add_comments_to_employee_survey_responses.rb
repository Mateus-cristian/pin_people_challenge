# frozen_string_literal: true

class AddCommentsToEmployeeSurveyResponses < ActiveRecord::Migration[8.1]
  def change
    add_column :employee_survey_responses, :comentarios_interesse_no_cargo, :text
    add_column :employee_survey_responses, :comentarios_contribuicao, :text
    add_column :employee_survey_responses, :comentarios_aprendizado_e_desenvolvimento, :text
    add_column :employee_survey_responses, :comentarios_feedback, :text
    add_column :employee_survey_responses, :comentarios_interacao_com_gestor, :text
    add_column :employee_survey_responses, :comentarios_clareza_sobre_possibilidades_de_carreira, :text
    add_column :employee_survey_responses, :comentarios_expectativa_de_permanencia, :text
  end
end
