# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeMetricsQuery do
  it 'calculates eNPS distribution' do
    create(:employee, enps: 10)
    create(:employee, enps: 3)

    result = described_class.new(Employee.all).enps_distribution

    expect(result['Promotores (9-10)']).to eq(1)
    expect(result['Detratores (0-6)']).to eq(1)
  end
end
