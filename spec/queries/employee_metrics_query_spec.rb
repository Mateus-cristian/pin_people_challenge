# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeMetricsQuery do
  it 'calculates eNPS distribution correctly' do
    emp1 = create(:employee)
    emp2 = create(:employee)
    create(:employee_survey_response, employee: emp1, enps: 10)
    create(:employee_survey_response, employee: emp2, enps: 3)

    result = described_class.new(Employee.all).enps_distribution

    expect(result['Promotores (9-10)']).to eq(1)
    expect(result['Detratores (0-6)']).to eq(1)
  end
end
