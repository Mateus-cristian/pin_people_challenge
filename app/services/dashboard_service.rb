# frozen_string_literal: true

class DashboardService
  def self.call(params = {})
    filtered_scope = EmployeeFilterQuery.call(params)

    all_metrics      = EmployeeMetricsQuery.new(Employee.all)
    filtered_metrics = EmployeeMetricsQuery.new(filtered_scope)

    {
      all: {
        employees_per_area: all_metrics.employees_per_area,
        avg_feedback_per_area: all_metrics.avg_feedback_per_area,
        enps_distribution: all_metrics.enps_distribution
      },
      filtered: {
        employees_per_area: filtered_metrics.employees_per_area,
        avg_feedback_per_area: filtered_metrics.avg_feedback_per_area,
        enps_distribution: filtered_metrics.enps_distribution
      },
      filters: {
        areas: Employee.distinct.pluck(:area),
        positions: Employee.distinct.pluck(:cargo),
        selected_area: params[:area],
        selected_position: params[:cargo]
      }
    }
  end
end
