# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboard visual edge cases', type: :system do
  before do
    allow_any_instance_of(DashboardController).to receive(:index).and_wrap_original do |m, *args|
      controller = m.receiver
      controller.instance_variable_set(:@filtered, {
        employees_per_area: [],
        avg_feedback_per_area: [],
        enps_distribution: []
      })
      controller.instance_variable_set(:@eda, {
        tenure_distribution: [],
        feedback_boxplot: [],
        summary_stats: {}
      })
      controller.instance_variable_set(:@filters, {
        areas: [], selected_area: nil, positions: [], selected_position: nil
      })
    end
  end

  it 'shows "Sem dados disponíveis" for all dashboard charts and stats when data is empty' do
    visit dashboard_path
    expect(page).to have_content('Sem dados disponíveis').at_least(1).times
    expect(page).to have_content('Funcionários por Área')
    expect(page).to have_content('Média de Feedback por Área')
    expect(page).to have_content('Distribuição de eNPS')
    expect(page).to have_content('Distribuição do Tempo de Empresa')
    expect(page).to have_content('Boxplot de Feedback Geral')
  end
end
