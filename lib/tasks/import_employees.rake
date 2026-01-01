namespace :import do
  desc 'Importa dados do CSV para a tabela employees'
  task employees: :environment do
    require 'csv'
    file_path = Rails.root.join('public', 'data.csv')
    
    puts "Importando: #{file_path}..."
    
    CSV.foreach(file_path, headers: true, col_sep: ';') do |row|
      attrs = row.to_h.slice(
        'nome', 'email', 'email_corporativo', 'area', 'cargo', 'funcao', 'localidade',
        'tempo_de_empresa', 'genero', 'geracao', 'n0_empresa', 'n1_diretoria', 'n2_gerencia',
        'n3_coordenacao', 'n4_area'
      )
      employee = Employee.find_or_initialize_by(email: attrs['email'])
      employee.assign_attributes(attrs)
      if employee.save
        puts "Importado: #{employee.email}"
      else
        puts "Erro ao importar #{employee.email}: #{employee.errors.full_messages.join(', ')}"
      end
    end
    puts 'Importação finalizada.'
  end
end
