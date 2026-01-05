# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ::ApplicationController
      protect_from_forgery with: :null_session

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: 'Resource not found', details: exception.message }, status: :not_found
      end

      rescue_from StandardError do |exception|
        render json: { error: 'Internal server error', details: exception.message }, status: :internal_server_error
      end
    end
  end
end
