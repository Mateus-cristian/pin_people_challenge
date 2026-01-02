# frozen_string_literal: true

class EmployeeMetricsQuery
  def initialize(scope = Employee.all)
    @scope = scope
  end

  def employees_per_area
    @scope.group(:area).count
  end

  def avg_feedback_per_area
    @scope
      .group(:area)
      .average(:feedback)
      .transform_values { |v| v&.round(2) }
  end

  def enps_distribution
    scoped = @scope.where.not(enps: nil)

    {
      'Promotores (9-10)' => scoped.where(enps: 9..10).count,
      'Passivos (7-8)'   => scoped.where(enps: 7..8).count,
      'Detratores (0-6)' => scoped.where(enps: 0..6).count
    }
  end
end
