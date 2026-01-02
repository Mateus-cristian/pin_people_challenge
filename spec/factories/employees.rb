# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    nome { "Funcionário Teste" }
    email { "funcionario@teste.com" }
    area { "TI" }
    cargo { "Desenvolvedor" }
    feedback { 5 }
    enps { 8 }
  end
end
