class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :nome
      t.string :email
      t.string :email_corporativo
      t.string :celular
      t.string :area
      t.string :cargo
      t.string :funcao
      t.string :localidade
      t.string :tempo_de_empresa
      t.string :genero
      t.string :geracao
      t.string :n0_empresa
      t.string :n1_diretoria
      t.string :n2_gerencia
      t.string :n3_coordenacao
      t.string :n4_area
      t.date :data_da_resposta
      t.integer :interesse_no_cargo
      t.text :comentarios_interesse_no_cargo
      t.integer :contribuicao
      t.text :comentarios_contribuicao
      t.integer :aprendizado_e_desenvolvimento
      t.text :comentarios_aprendizado_e_desenvolvimento
      t.integer :feedback
      t.text :comentarios_feedback
      t.integer :interacao_com_gestor
      t.text :comentarios_interacao_com_gestor
      t.integer :clareza_sobre_possibilidades_de_carreira
      t.text :comentarios_clareza_sobre_possibilidades_de_carreira
      t.integer :expectativa_de_permanencia
      t.text :comentarios_expectativa_de_permanencia
      t.integer :enps
      t.text :aberta_enps

      t.timestamps
    end
  end
end
