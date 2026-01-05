# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeProfileService do
  describe '.call' do
    it 'calculates area average correctly' do
      emp1 = create(:employee, area: 'TI')
      emp2 = create(:employee, area: 'TI')
      create(:employee_survey_response, employee: emp1, feedback: 4)
      create(:employee_survey_response, employee: emp2, feedback: 2)

      result = described_class.call(emp2)

      expect(result[:avg_feedback_area]).to eq(3.0)
    end

    it 'calculates company average correctly' do
      emp1 = create(:employee, area: 'RH')
      emp2 = create(:employee, area: 'TI')
      create(:employee_survey_response, employee: emp1, feedback: 5)
      create(:employee_survey_response, employee: emp2, feedback: 3)

      result = described_class.call(emp2)

      expect(result[:avg_feedback_company]).to eq(4.0)
    end
  end
end
