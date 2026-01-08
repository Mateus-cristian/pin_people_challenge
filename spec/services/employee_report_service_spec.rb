# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::EmployeeReportService do
  let(:employee) { Employee.create!(nome: 'João', tempo_de_empresa: '1 a 3', email: 'joao@exemplo.com') }
  let!(:response) { EmployeeSurveyResponse.create!(employee: employee, comentarios_feedback: 'Ótimo ambiente', enps: 10, interesse_no_cargo: 8) }

  it 'returns aggregated executive metrics' do
    result = Reports::EmployeeReportService.call
    expect(result).to include(:headcount, :avg_feedback, :enps, :sentiment)
    expect(result[:headcount]).to be >= 1
    expect(result[:enps]).to be_a(Numeric)
    expect(result[:sentiment]).to be_a(Hash)
  end

  it 'calculates eNPS correctly' do
    result = Reports::EmployeeReportService.call
    expect(result[:enps]).to be_between(-100, 100)
  end
end
