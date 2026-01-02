# frozen_string_literal: true

require 'swagger_helper'

describe 'Employees API' do
  path '/api/v1/employees' do
    get 'Retorna uma lista paginada de empregados' do
      tags 'Empregados'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, description: 'Número da página'
      parameter name: :per, in: :query, type: :integer, description: 'Itens por página'
      parameter name: :order, in: :query, type: :string, description: 'Ordenação: asc ou desc', required: false, enum: [ 'asc', 'desc' ]

      response '200', 'empregados encontrados' do
        let(:page)  { 1 }
        let(:per)   { 10 }
        let(:order) { 'asc' }

        schema type: :object,
               properties: {
                 employees: { type: :array, items: { '$ref' => '#/components/schemas/employee' } },
                 meta: {
                   type: :object,
                   properties: {
                     current_page: { type: :integer },
                     total_pages: { type: :integer },
                     total_count: { type: :integer }
                   }
                 }
               }

        let!(:employees) { create_list(:employee, 3) }
        run_test!
      end
    end
  end

  path '/api/v1/employees/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'ID do empregado'

    get 'Retorna um empregado específico' do
      tags 'Empregados'
      produces 'application/json'
      response '200', 'empregado encontrado' do
        schema '$ref' => '#/components/schemas/employee'
        let(:id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        run_test!
      end
      response '404', 'empregado não encontrado' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Atualiza um empregado' do
      tags 'Empregados'
      consumes 'application/json'
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          email: { type: :string }
        },
        required: [ 'nome', 'email' ]
      }
      response '200', 'empregado atualizado' do
        let(:id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        let(:employee) { { nome: 'Novo Nome', email: 'novo@empresa.com' } }
        run_test!
      end
      response '404', 'empregado não encontrado' do
        let(:id) { 'invalid' }
        let(:employee) { { nome: 'Novo Nome', email: 'novo@empresa.com' } }
        run_test!
      end
    end

    delete 'Remove um empregado' do
      tags 'Empregados'
      response '204', 'empregado removido' do
        let(:id) { Employee.create!(nome: 'Teste', email: 'teste@empresa.com').id }
        run_test!
      end
      response '404', 'empregado não encontrado' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/employees' do
    post 'Cria um empregado' do
      tags 'Empregados'
      consumes 'application/json'
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          email: { type: :string },
          email_corporativo: { type: :string },
          area: { type: :string },
          cargo: { type: :string },
          funcao: { type: :string },
          localidade: { type: :string },
          tempo_de_empresa: { type: :string },
          genero: { type: :string },
          geracao: { type: :string },
          n0_empresa: { type: :string },
          n1_diretoria: { type: :string },
          n2_gerencia: { type: :string },
          n3_coordenacao: { type: :string },
          n4_area: { type: :string },
          data_da_resposta: { type: :string, format: :date },
          interesse_no_cargo: { type: :integer },
          comentarios_interesse_no_cargo: { type: :string },
          contribuicao: { type: :integer },
          comentarios_contribuicao: { type: :string },
          aprendizado_e_desenvolvimento: { type: :integer },
          comentarios_aprendizado_e_desenvolvimento: { type: :string },
          feedback: { type: :integer },
          comentarios_feedback: { type: :string },
          interacao_com_gestor: { type: :integer },
          comentarios_interacao_com_gestor: { type: :string },
          clareza_sobre_possibilidades_de_carreira: { type: :integer },
          comentarios_clareza_sobre_possibilidades_de_carreira: { type: :string },
          expectativa_de_permanencia: { type: :integer },
          comentarios_expectativa_de_permanencia: { type: :string },
          enps: { type: :integer },
          aberta_enps: { type: :string }
        },
        required: [ 'nome', 'email' ]
      }
      response '201', 'empregado criado' do
        let(:employee) { {
          nome: 'Criado',
          email: 'criado@empresa.com',
          email_corporativo: 'criado_corp@empresa.com',
          area: 'TI',
          cargo: 'Analista',
          funcao: 'Desenvolvedor',
          localidade: 'São Paulo',
          tempo_de_empresa: '2 anos',
          genero: 'masculino',
          geracao: 'geração z',
          n0_empresa: 'empresa',
          n1_diretoria: 'diretoria a',
          n2_gerencia: 'gerência a1',
          n3_coordenacao: 'coordenação a11',
          n4_area: 'área a112',
          data_da_resposta: '2022-01-20',
          interesse_no_cargo: 7,
          comentarios_interesse_no_cargo: '-',
          contribuicao: 1,
          comentarios_contribuicao: '-',
          aprendizado_e_desenvolvimento: 1,
          comentarios_aprendizado_e_desenvolvimento: '-',
          feedback: 6,
          comentarios_feedback: '-',
          interacao_com_gestor: 6,
          comentarios_interacao_com_gestor: '-',
          clareza_sobre_possibilidades_de_carreira: 6,
          comentarios_clareza_sobre_possibilidades_de_carreira: '-',
          expectativa_de_permanencia: 2,
          comentarios_expectativa_de_permanencia: '-',
          enps: 5,
          aberta_enps: 'A empresa tem um excelente ambiente de trabalho e equipe colaborativa.'
        } }
        run_test!
      end
      response '422', 'requisição inválida' do
        let(:employee) { { nome: '' } }
        run_test!
      end
    end
  end
end
