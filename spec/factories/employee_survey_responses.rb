# frozen_string_literal: true

FactoryBot.define do
  factory :employee_survey_response do
    association :employee
    interesse_no_cargo { 5 }
    comentarios_interesse_no_cargo { "Comentário interesse" }
    contribuicao { 5 }
    comentarios_contribuicao { "Comentário contribuição" }
    aprendizado_e_desenvolvimento { 5 }
    comentarios_aprendizado_e_desenvolvimento { "Comentário aprendizado" }
    feedback { 5 }
    comentarios_feedback { "Comentário feedback" }
    interacao_com_gestor { 5 }
    comentarios_interacao_com_gestor { "Comentário gestor" }
    clareza_sobre_possibilidades_de_carreira { 5 }
    comentarios_clareza_sobre_possibilidades_de_carreira { "Comentário clareza" }
    expectativa_de_permanencia { 5 }
    comentarios_expectativa_de_permanencia { "Comentário permanência" }
    enps { 5 }
    data_da_resposta { Date.today }
  end
end
