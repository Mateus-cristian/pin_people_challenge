# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    data = DashboardService.call(params)
    @filtered = data[:filtered]
    @filters  = data[:filters]
    @eda      = EmployeeEdaService.call
    @report   = Reports::EmployeeReportService.call
  end

  def pdf
    data = DashboardService.call(params)
    @filtered = data[:filtered]
    @filters  = data[:filters]
    @eda      = EmployeeEdaService.call
    @report   = Reports::EmployeeReportService.call
    render pdf: "dashboard",
           template: "dashboard/pdf",
           layout: "pdf"
  end
end
