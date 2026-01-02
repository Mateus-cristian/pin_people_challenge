# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @data = DashboardService.call(params)
  end
end
