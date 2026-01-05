# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    data = DashboardService.call(params)
    @filtered = data[:filtered]
    @filters  = data[:filters]
    @eda      = EmployeeEdaService.call
  end
end
