# frozen_string_literal: true

class DashboardService
  def self.call(params = {})
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    {
      all: build_metrics(Employee),
      filtered: build_metrics(filtered_scope),
      filters: filters_payload
    }
  end

  private

  attr_reader :params

  def filtered_scope
    @filtered_scope ||= EmployeeFilterQuery.call(params)
  end

  def build_metrics(scope)
    metrics = EmployeeMetricsQuery.new(scope)

    {
      employees_per_area: metrics.employees_per_area,
      avg_feedback_per_area: metrics.avg_feedback_per_area,
      enps_distribution: metrics.enps_distribution
    }
  end

  def filters_payload
    {
      areas: cached_areas,
      positions: cached_positions,
      selected_area: params[:area],
      selected_position: params[:cargo]
    }
  end

  def cached_areas
    Rails.cache.fetch('employees/areas', expires_in: 6.hours) do
      Employee.distinct.pluck(:area)
    end
  end

  def cached_positions
    Rails.cache.fetch('employees/positions', expires_in: 6.hours) do
      Employee.distinct.pluck(:cargo)
    end
  end
end
