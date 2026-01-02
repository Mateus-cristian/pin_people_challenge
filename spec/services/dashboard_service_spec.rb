# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardService do
  it 'returns aggregated data' do
    create(:employee, area: 'TI', feedback: 2, enps: 3)
    data = described_class.call({})

    expect(data[:all][:employees_per_area]['TI']).to eq(1)
  end
end
