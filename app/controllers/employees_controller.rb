# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.page(params[:page]).per(10)
  end
end
