# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Employees Dashboard Edge Cases', type: :system do
  it 'shows message when there are no employees' do
    Employee.delete_all
    visit employees_path
    expect(page).to have_content('Nenhum funcionário cadastrado')
  end
end
