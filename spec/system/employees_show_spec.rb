# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee profile page', type: :system do
  let!(:employee) do
    emp = Employee.create!(nome: 'João', email: 'joao@empresa.com', email_corporativo: 'joao@corp.com', area: 'TI', cargo: 'Dev', localidade: 'SP', tempo_de_empresa: '2', geracao: 'Z')
    EmployeeSurveyResponse.create!(employee: emp, feedback: 4, enps: 9, interesse_no_cargo: 5)
    emp
  end
  let!(:other_employee) do
    emp = Employee.create!(nome: 'Maria', email: 'maria@empresa.com', email_corporativo: 'maria@corp.com', area: 'TI', cargo: 'Dev', localidade: 'SP', tempo_de_empresa: '3', geracao: 'Y')
    EmployeeSurveyResponse.create!(employee: emp, feedback: 5, enps: 10, interesse_no_cargo: 5)
    emp
  end

  it 'shows employee details and comparatives' do
    visit employees_path
    click_link 'Ver detalhes', match: :first
    expect(page).to have_content('João')
    expect(page).to have_content('joao@empresa.com')
    expect(page).to have_content('TI')
    expect(page).to have_content('Dev')
    expect(page).to have_content('SP')
    expect(page).to have_content('2')
    expect(page).to have_content('Z')
    expect(page).to have_content('4/10')
    expect(page).to have_content('9/10')
    expect(page).to have_content('4.5')
    expect(page).to have_link('Voltar à lista')
  end
end
