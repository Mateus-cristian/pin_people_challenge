# frozen_string_literal: true


class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def index
    @employees = Employee.page(params[:page]).per(10)
  end

  def show
    data = EmployeeProfileService.call(@employee)
    @employee = data[:employee]
    @avg_feedback_area = data[:avg_feedback_area]
    @avg_feedback_company = data[:avg_feedback_company]
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to employees_path, alert: 'Funcionário não encontrado'
  end
end
