class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_path, notice: "Employee was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.expect(employee: [ :nome, :email, :email_corporativo, :celular, :area, :cargo, :funcao, :localidade, :tempo_de_empresa, :genero, :geracao, :n0_empresa, :n1_diretoria, :n2_gerencia, :n3_coordenacao, :n4_area, :data_da_resposta, :interesse_no_cargo, :comentarios_interesse_no_cargo, :contribuicao, :comentarios_contribuicao, :aprendizado_e_desenvolvimento, :comentarios_aprendizado_e_desenvolvimento, :feedback, :comentarios_feedback, :interacao_com_gestor, :comentarios_interacao_com_gestor, :clareza_sobre_possibilidades_de_carreira, :comentarios_clareza_sobre_possibilidades_de_carreira, :expectativa_de_permanencia, :comentarios_expectativa_de_permanencia, :enps, :aberta_enps ])
    end
end
