# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "employees/index.html.erb", type: :view do
  it "shows message when there are no employees" do
    assign(:employees, Employee.none.page(1))
    render
    expect(rendered).to include("Nenhum funcionário cadastrado")
  end

  it "shows the list when there are employees" do
    Employee.create!(nome: "João", email: "joao@empresa.com")
    assign(:employees, Employee.page(1))
    render
    expect(rendered).to include("João")
    expect(rendered).not_to include("Nenhum funcionário cadastrado")
  end
end
