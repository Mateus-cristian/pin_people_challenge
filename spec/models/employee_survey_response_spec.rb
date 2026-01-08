# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeSurveyResponse, type: :model do
  let(:employee) { Employee.create!(nome: 'Ana', email: 'ana@email.com') }

  it 'is valid with interesse_no_cargo' do
    resp = described_class.new(employee: employee, interesse_no_cargo: 7)
    expect(resp).to be_valid
  end

  it 'is invalid without interesse_no_cargo' do
    resp = described_class.new(employee: employee, interesse_no_cargo: nil)
    expect(resp).not_to be_valid
  end

  it 'validates feedback and enps in range' do
    resp = described_class.new(employee: employee, interesse_no_cargo: 5, feedback: 11, enps: -1)
    expect(resp).not_to be_valid
    resp.feedback = 10
    resp.enps = 0
    expect(resp).to be_valid
  end

  it 'returns compacted scores hash' do
    resp = described_class.new(employee: employee, interesse_no_cargo: 5, contribuicao: 4, enps: 8)
    expect(resp.scores).to include(:interesse_no_cargo, :contribuicao, :enps)
    expect(resp.scores).not_to include(:feedback)
  end
end
