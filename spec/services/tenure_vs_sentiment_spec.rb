# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Insights::TenureVsSentiment do
  let!(:junior) { Employee.create!(nome: 'Junior', tempo_de_empresa: '1 a 3', email: 'junior@exemplo.com') }
  let!(:senior) { Employee.create!(nome: 'Senior', tempo_de_empresa: '5+', email: 'senior@exemplo.com') }
  let!(:resp1) { EmployeeSurveyResponse.create!(employee: junior, comentarios_feedback: 'Muito bom', enps: 9, interesse_no_cargo: 8) }
  let!(:resp2) { EmployeeSurveyResponse.create!(employee: senior, comentarios_feedback: 'Poderia ser melhor', enps: 5, interesse_no_cargo: 7) }

  it 'returns sentiment distribution by tenure bucket' do
    result = described_class.new.call
    expect(result).to be_a(Hash)
    expect(result.keys).to include('1-3', '5+')
    expect(result.values).to all(be_a(Hash))
  end

  it 'returns empty for buckets with no responses' do
    Employee.destroy_all
    expect(described_class.new.call.values).to eq([])
  end
end
