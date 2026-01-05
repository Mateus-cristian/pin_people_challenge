# frozen_string_literal: true

class EmployeeSurveyResponse < ApplicationRecord
  belongs_to :employee

  validates :feedback, :enps, inclusion: { in: 0..10 }, allow_nil: true
  validates :interesse_no_cargo, presence: true

  def scores
    {
      interesse_no_cargo: interesse_no_cargo,
      contribuicao: contribuicao,
      aprendizado_e_desenvolvimento: aprendizado_e_desenvolvimento,
      feedback: feedback,
      interacao_com_gestor: interacao_com_gestor,
      clareza_sobre_possibilidades_de_carreira: clareza_sobre_possibilidades_de_carreira,
      expectativa_de_permanencia: expectativa_de_permanencia,
      enps: enps
    }.compact
  end
end
