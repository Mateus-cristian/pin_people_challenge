# frozen_string_literal: true

class DashboardPresenter
  def initialize(data)
    @data = data
  end

  def as_json(*_args)
    {
      all: {
        employees_per_area: @data[:all][:employees_per_area],
        avg_feedback_per_area: @data[:all][:avg_feedback_per_area],
        enps_distribution: @data[:all][:enps_distribution]
      },
      filtered: {
        employees_per_area: @data[:filtered][:employees_per_area],
        avg_feedback_per_area: @data[:filtered][:avg_feedback_per_area],
        enps_distribution: @data[:filtered][:enps_distribution]
      },
      filters: @data[:filters]
    }
  end
end
