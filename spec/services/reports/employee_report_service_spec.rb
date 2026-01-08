# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::EmployeeReportService, type: :service do
  let!(:employee) { Employee.create!(nome: 'João', email: 'joao@email.com') }
  let!(:response1) do
    EmployeeSurveyResponse.create!(employee: employee, feedback: 8, enps: 9, comentarios_feedback: 'Ótimo ambiente!', interesse_no_cargo: 'Sim')
  end
  let!(:response2) do
    EmployeeSurveyResponse.create!(employee: employee, feedback: 4, enps: 2, comentarios_feedback: 'Ruim demais', interesse_no_cargo: 'Não')
  end
  let!(:response3) do
    EmployeeSurveyResponse.create!(employee: employee, feedback: 6, enps: 7, comentarios_feedback: 'Neutro', interesse_no_cargo: 'Talvez')
  end

  subject { described_class.call(EmployeeSurveyResponse.all) }

  it 'returns the correct headcount' do
    expect(subject[:headcount]).to eq(Employee.count)
  end

  it 'calculates the average feedback correctly' do
    expect(subject[:avg_feedback]).to eq(EmployeeSurveyResponse.average(:feedback).round(2))
  end

  it 'calculates the eNPS correctly' do
    expect(subject[:enps]).to eq((((1.0/3)-(1.0/3))*100).round)
  end

  it 'classifies the comment sentiment using the Analyzer' do
    expect(subject[:sentiment]).to eq({ positive: 0, negative: 33, neutral: 67 })
  end

  it 'returns the expected keys' do
    expect(subject.keys).to contain_exactly(:headcount, :avg_feedback, :enps, :sentiment)
  end
end
