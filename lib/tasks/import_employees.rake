# frozen_string_literal: true

namespace :import do
  desc 'Importa dados do CSV para Employee e EmployeeSurveyResponse'
  task employees: :environment do
    require 'csv'
    file_path = Rails.root.join('public', 'data.csv')

    puts "Importando: #{file_path}..."

    CSV.foreach(file_path, headers: true, col_sep: ';') do |row|
      emp_attrs = row.to_h.slice(
        'nome', 'email', 'email_corporativo', 'area', 'cargo', 'funcao', 'localidade',
        'tempo_de_empresa', 'genero', 'geracao', 'n0_empresa', 'n1_diretoria', 'n2_gerencia',
        'n3_coordenacao', 'n4_area'
      )

      employee = Employee.find_or_initialize_by(email: emp_attrs['email'])
      employee.assign_attributes(emp_attrs)
      unless employee.save
        puts "Erro ao importar #{employee.email}: #{employee.errors.full_messages.join(', ')}"
        next
      end

      # Cria uma resposta de pesquisa associada
      survey_attrs = {
        interesse_no_cargo: row['Interesse no Cargo'],
        comentarios_interesse_no_cargo: row['Comentários - Interesse no Cargo'],
        contribuicao: row['Contribuição'],
        comentarios_contribuicao: row['Comentários - Contribuição'],
        aprendizado_e_desenvolvimento: row['Aprendizado e Desenvolvimento'],
        comentarios_aprendizado_e_desenvolvimento: row['Comentários - Aprendizado e Desenvolvimento'],
        feedback: row['Feedback'],
        comentarios_feedback: row['Comentários - Feedback'],
        interacao_com_gestor: row['Interação com Gestor'],
        comentarios_interacao_com_gestor: row['Comentários - Interação com Gestor'],
        clareza_sobre_possibilidades_de_carreira: row['Clareza sobre Possibilidades de Carreira'],
        comentarios_clareza_sobre_possibilidades_de_carreira: row['Comentários - Clareza sobre Possibilidades de Carreira'],
        expectativa_de_permanencia: row['Expectativa de Permanência'],
        comentarios_expectativa_de_permanencia: row['Comentários - Expectativa de Permanência'],
        enps: row['eNPS'],
        data_da_resposta: row['Data da Resposta']
      }

      employee.survey_responses.create!(survey_attrs)
      puts "Importado: #{employee.email} (resposta vinculada)"
    end
    puts 'Importação finalizada.'
  end
end
