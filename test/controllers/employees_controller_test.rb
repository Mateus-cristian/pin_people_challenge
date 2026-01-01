require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { aberta_enps: @employee.aberta_enps, aprendizado_e_desenvolvimento: @employee.aprendizado_e_desenvolvimento, area: @employee.area, cargo: @employee.cargo, celular: @employee.celular, clareza_sobre_possibilidades_de_carreira: @employee.clareza_sobre_possibilidades_de_carreira, comentarios_aprendizado_e_desenvolvimento: @employee.comentarios_aprendizado_e_desenvolvimento, comentarios_clareza_sobre_possibilidades_de_carreira: @employee.comentarios_clareza_sobre_possibilidades_de_carreira, comentarios_contribuicao: @employee.comentarios_contribuicao, comentarios_expectativa_de_permanencia: @employee.comentarios_expectativa_de_permanencia, comentarios_feedback: @employee.comentarios_feedback, comentarios_interacao_com_gestor: @employee.comentarios_interacao_com_gestor, comentarios_interesse_no_cargo: @employee.comentarios_interesse_no_cargo, contribuicao: @employee.contribuicao, data_da_resposta: @employee.data_da_resposta, email: @employee.email, email_corporativo: @employee.email_corporativo, enps: @employee.enps, expectativa_de_permanencia: @employee.expectativa_de_permanencia, feedback: @employee.feedback, funcao: @employee.funcao, genero: @employee.genero, geracao: @employee.geracao, interacao_com_gestor: @employee.interacao_com_gestor, interesse_no_cargo: @employee.interesse_no_cargo, localidade: @employee.localidade, n0_empresa: @employee.n0_empresa, n1_diretoria: @employee.n1_diretoria, n2_gerencia: @employee.n2_gerencia, n3_coordenacao: @employee.n3_coordenacao, n4_area: @employee.n4_area, nome: @employee.nome, tempo_de_empresa: @employee.tempo_de_empresa } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { aberta_enps: @employee.aberta_enps, aprendizado_e_desenvolvimento: @employee.aprendizado_e_desenvolvimento, area: @employee.area, cargo: @employee.cargo, celular: @employee.celular, clareza_sobre_possibilidades_de_carreira: @employee.clareza_sobre_possibilidades_de_carreira, comentarios_aprendizado_e_desenvolvimento: @employee.comentarios_aprendizado_e_desenvolvimento, comentarios_clareza_sobre_possibilidades_de_carreira: @employee.comentarios_clareza_sobre_possibilidades_de_carreira, comentarios_contribuicao: @employee.comentarios_contribuicao, comentarios_expectativa_de_permanencia: @employee.comentarios_expectativa_de_permanencia, comentarios_feedback: @employee.comentarios_feedback, comentarios_interacao_com_gestor: @employee.comentarios_interacao_com_gestor, comentarios_interesse_no_cargo: @employee.comentarios_interesse_no_cargo, contribuicao: @employee.contribuicao, data_da_resposta: @employee.data_da_resposta, email: @employee.email, email_corporativo: @employee.email_corporativo, enps: @employee.enps, expectativa_de_permanencia: @employee.expectativa_de_permanencia, feedback: @employee.feedback, funcao: @employee.funcao, genero: @employee.genero, geracao: @employee.geracao, interacao_com_gestor: @employee.interacao_com_gestor, interesse_no_cargo: @employee.interesse_no_cargo, localidade: @employee.localidade, n0_empresa: @employee.n0_empresa, n1_diretoria: @employee.n1_diretoria, n2_gerencia: @employee.n2_gerencia, n3_coordenacao: @employee.n3_coordenacao, n4_area: @employee.n4_area, nome: @employee.nome, tempo_de_empresa: @employee.tempo_de_empresa } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
