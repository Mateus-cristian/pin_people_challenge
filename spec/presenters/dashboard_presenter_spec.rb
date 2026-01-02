# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardPresenter do
  let(:data) do
    {
      all: {
        employees_per_area: { 'TI' => 2 },
        avg_feedback_per_area: { 'TI' => 4.5 },
        enps_distribution: { 'Promoters (9-10)' => 1, 'Passives (7-8)' => 0, 'Detractors (0-6)' => 1 }
      },
      filtered: {
        employees_per_area: { 'TI' => 1 },
        avg_feedback_per_area: { 'TI' => 5.0 },
        enps_distribution: { 'Promoters (9-10)' => 1, 'Passives (7-8)' => 0, 'Detractors (0-6)' => 0 }
      },
      filters: {
        areas: [ 'TI' ],
        positions: [ 'Dev' ],
        selected_area: 'TI',
        selected_position: 'Dev'
      }
    }
  end

  it 'serializes the data correctly to JSON' do
    presenter = described_class.new(data)
    json = presenter.as_json
    expect(json[:all][:employees_per_area]['TI']).to eq(2)
    expect(json[:filtered][:avg_feedback_per_area]['TI']).to eq(5.0)
    expect(json[:filters][:areas]).to include('TI')
  end
end
