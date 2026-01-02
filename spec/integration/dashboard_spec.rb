# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Dashboard API', type: :request do
  path '/api/v1/dashboard' do
    get 'Retorna os dados agregados do dashboard' do
      tags 'Dashboard'
      produces 'application/json'
      parameter name: :area, in: :query, type: :string, description: 'Área para filtro', required: false
      parameter name: :cargo, in: :query, type: :string, description: 'Cargo para filtro', required: false

      response '200', 'dados retornados' do
        schema type: :object,
          properties: {
            all: {
              type: :object,
              properties: {
                employees_per_area: { type: :object, additionalProperties: { type: :integer } },
                avg_feedback_per_area: { type: :object, additionalProperties: { type: :number } },
                enps_distribution: { type: :object, additionalProperties: { type: :integer } }
              }
            },
            filtered: {
              type: :object,
              properties: {
                employees_per_area: { type: :object, additionalProperties: { type: :integer } },
                avg_feedback_per_area: { type: :object, additionalProperties: { type: :number } },
                enps_distribution: { type: :object, additionalProperties: { type: :integer } }
              }
            },
            filters: {
              type: :object,
              properties: {
                areas: { type: :array, items: { type: :string } },
                positions: { type: :array, items: { type: :string } },
                selected_area: { type: :string, nullable: true },
                selected_position: { type: :string, nullable: true }
              }
            }
          },
          required: [ 'all', 'filtered', 'filters' ]

        run_test!
      end
    end
  end
end
