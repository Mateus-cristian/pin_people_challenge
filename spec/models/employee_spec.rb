# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is valid with name and email' do
    emp = described_class.new(nome: 'Maria', email: 'maria@email.com')
    expect(emp).to be_valid
  end

  it 'is invalid without name' do
    emp = described_class.new(nome: nil, email: 'maria@email.com')
    expect(emp).not_to be_valid
  end

  it 'is invalid without email' do
    emp = described_class.new(nome: 'Maria', email: nil)
    expect(emp).not_to be_valid
  end

  it 'destroys responses when destroyed' do
    emp = described_class.create!(nome: 'Maria', email: 'maria@email.com')
    emp.survey_responses.create!(interesse_no_cargo: 5)
    expect { emp.destroy }.to change(EmployeeSurveyResponse, :count).by(-1)
  end
end
