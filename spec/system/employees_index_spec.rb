# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees index', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'shows message when there are no employees' do
    Employee.delete_all
      visit employees_path
      expect(page).to have_content('Nenhum funcionário cadastrado')
  end

  it 'shows the list when there are employees' do
    Employee.create!(nome: 'João', email: 'joao@empresa.com')
    visit employees_path
    expect(page).to have_content('João')
    expect(page).not_to have_content('Nenhum funcionário cadastrado')
  end
end
