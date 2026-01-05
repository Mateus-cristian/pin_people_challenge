# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < Api::V1::ApplicationController
      def index
        order = params[:order]&.downcase == 'desc' ? :desc : :asc
        employees = Employee.order(nome: order).page(params[:page]).per(params[:per] || 25)
        render json: {
          employees: employees,
          meta: {
            current_page: employees.current_page,
            total_pages: employees.total_pages,
            total_count: employees.total_count
          }
        }
      end

      def show
        begin
          employee = Employee.find(params[:id])
          render json: employee

        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Employee not found' }, status: :not_found
        end
      end

      def create
        employee = Employee.new(employee_params)
        if employee.save
          render json: employee, status: :created
          return
        end

        render json: employee.errors, status: :unprocessable_entity
      end

      def update
        begin
          employee = Employee.find(params[:id])
          if !employee.update(employee_params)
            render json: employee.errors, status: :unprocessable_entity
            return
          end
          render json: employee
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: 'Employee not found', details: e.message }, status: :not_found
        end
      end

      def destroy
        begin
        employee = Employee.find(params[:id])
        employee.destroy!

        head :no_content

        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Employee not found' }, status: :not_found
        end
      end

      private

      def employee_params
        params.require(:employee).permit(:nome, :email, :email_corporativo, :celular, :area, :cargo, :funcao, :localidade, :tempo_de_empresa, :genero, :geracao, :n0_empresa, :n1_diretoria, :n2_gerencia, :n3_coordenacao, :n4_area, :data_da_resposta, :interesse_no_cargo, :comentarios_interesse_no_cargo, :contribuicao, :comentarios_contribuicao, :aprendizado_e_desenvolvimento, :comentarios_aprendizado_e_desenvolvimento, :feedback, :comentarios_feedback, :interacao_com_gestor, :comentarios_interacao_com_gestor, :clareza_sobre_possibilidades_de_carreira, :comentarios_clareza_sobre_possibilidades_de_carreira, :expectativa_de_permanencia, :comentarios_expectativa_de_permanencia, :enps, :aberta_enps)
      end
    end
  end
end
