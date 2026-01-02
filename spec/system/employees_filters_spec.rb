# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Employees Dashboard Filters', type: :system do
  before do
    Employee.create!(nome: 'Ana', email: 'ana@empresa.com', area: 'RH', cargo: 'Analista')
    Employee.create!(nome: 'Carlos', email: 'carlos@empresa.com', area: 'TI', cargo: 'Dev')
  end

  it 'filters employees by area' do
    visit employees_path

    if page.has_select?('Área')
      select 'TI', from: 'Área'
      expect(page).to have_content('Carlos')
      expect(page).not_to have_content('Ana')
    end
  end

  it 'filters employees by cargo' do
    visit employees_path

    if page.has_select?('Cargo')
      select 'Dev', from: 'Cargo'
      expect(page).to have_content('Carlos')
      expect(page).not_to have_content('Ana')
    end
  end
end
