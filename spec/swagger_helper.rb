# frozen_string_literal: true

require 'rails_helper'


RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000'
        }
      ],
      components: {
        schemas: {
                    employee_survey_response: {
                      type: :object,
                      properties: {
                        id: { type: :integer },
                        interesse_no_cargo: { type: :integer },
                        comentarios_interesse_no_cargo: { type: :string, nullable: true },
                        contribuicao: { type: :integer, nullable: true },
                        comentarios_contribuicao: { type: :string, nullable: true },
                        aprendizado_e_desenvolvimento: { type: :integer, nullable: true },
                        comentarios_aprendizado_e_desenvolvimento: { type: :string, nullable: true },
                        feedback: { type: :integer, nullable: true },
                        comentarios_feedback: { type: :string, nullable: true },
                        interacao_com_gestor: { type: :integer, nullable: true },
                        comentarios_interacao_com_gestor: { type: :string, nullable: true },
                        clareza_sobre_possibilidades_de_carreira: { type: :integer, nullable: true },
                        comentarios_clareza_sobre_possibilidades_de_carreira: { type: :string, nullable: true },
                        expectativa_de_permanencia: { type: :integer, nullable: true },
                        comentarios_expectativa_de_permanencia: { type: :string, nullable: true },
                        enps: { type: :integer, nullable: true },
                        aberta_enps: { type: :string, nullable: true },
                        data_da_resposta: { type: :string, format: :date },
                        created_at: { type: :string, format: :date_time },
                        updated_at: { type: :string, format: :date_time }
                      },
                      required: [ 'interesse_no_cargo', 'data_da_resposta' ]
                    },
          employee: {
            type: :object,
            properties: {
              id: { type: :integer },
              nome: { type: :string },
              email: { type: :string },
              email_corporativo: { type: :string, nullable: true },
              area: { type: :string, nullable: true },
              cargo: { type: :string, nullable: true },
              funcao: { type: :string, nullable: true },
              genero: { type: :string, nullable: true },
              n0_empresa: { type: :string, nullable: true },
              n1_diretoria: { type: :string, nullable: true },
              n2_gerencia: { type: :string, nullable: true },
              n3_coordenacao: { type: :string, nullable: true },
              n4_area: { type: :string, nullable: true },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: [ 'nome', 'email' ]
          }
        }
      }
    }
  }
end
