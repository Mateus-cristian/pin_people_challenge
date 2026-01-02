# frozen_string_literal: true

class EmployeeFilterQuery
  def self.call(params)
    scope = Employee.all
    scope = scope.where(area: params[:area]) if params[:area].present?
    scope = scope.where(cargo: params[:cargo]) if params[:cargo].present?
    scope
  end
end
