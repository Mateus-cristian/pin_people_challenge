# frozen_string_literal: true

module Api
  module V1
    class DashboardController < ApiController
      def show
        data = DashboardService.call(params)
        render json: DashboardPresenter.new(data).as_json
      end
    end
  end
end
