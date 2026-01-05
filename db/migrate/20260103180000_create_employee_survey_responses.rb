# frozen_string_literal: true

class CreateEmployeeSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_survey_responses do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer :interesse_no_cargo
      t.integer :contribuicao
      t.integer :aprendizado_e_desenvolvimento
      t.integer :feedback
      t.integer :interacao_com_gestor
      t.integer :clareza_sobre_possibilidades_de_carreira
      t.integer :expectativa_de_permanencia
      t.integer :enps
      t.date :data_da_resposta
      t.timestamps
    end
  end
end
