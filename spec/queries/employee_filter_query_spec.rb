# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeFilterQuery do
  it 'filters by area' do
    create(:employee, area: 'TI')
    create(:employee, area: 'RH')

    result = described_class.call(area: 'TI')

    expect(result.count).to eq(1)
  end
end
