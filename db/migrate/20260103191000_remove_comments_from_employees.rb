# frozen_string_literal: true

class RemoveCommentsFromEmployees < ActiveRecord::Migration[8.1]
  def change
    remove_column :employees, :comentarios_interesse_no_cargo, :text
    remove_column :employees, :comentarios_contribuicao, :text
    remove_column :employees, :comentarios_aprendizado_e_desenvolvimento, :text
    remove_column :employees, :comentarios_feedback, :text
    remove_column :employees, :comentarios_interacao_com_gestor, :text
    remove_column :employees, :comentarios_clareza_sobre_possibilidades_de_carreira, :text
    remove_column :employees, :comentarios_expectativa_de_permanencia, :text
  end
end
