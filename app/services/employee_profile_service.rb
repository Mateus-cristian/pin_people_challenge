# frozen_string_literal: true

class EmployeeProfileService
  def self.call(employee)
    {
      employee: employee,
      avg_feedback_area: avg_feedback_area(employee),
      avg_feedback_company: avg_feedback_company
    }
  end

  def self.avg_feedback_area(employee)
    EmployeeSurveyResponse
      .joins(:employee)
      .where(employees: { area: employee.area })
      .where.not(feedback: nil)
      .average(:feedback)
      &.round(2)
  end

  def self.avg_feedback_company
    EmployeeSurveyResponse
      .where.not(feedback: nil)
      .average(:feedback)
      &.round(2)
  end
end
