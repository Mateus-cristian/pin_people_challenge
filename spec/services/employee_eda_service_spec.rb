# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeEdaService, type: :service do
  describe '.call' do
    let!(:employee1) { Employee.create!(nome: 'A', email: 'a@a.com', tempo_de_empresa: 'menos de 1 ano', feedback: 2) }
    let!(:employee2) { Employee.create!(nome: 'B', email: 'b@b.com', tempo_de_empresa: '2', feedback: 4) }
    let!(:employee3) { Employee.create!(nome: 'C', email: 'c@c.com', tempo_de_empresa: '1', feedback: 5) }
    let!(:employee4) { Employee.create!(nome: 'D', email: 'd@d.com', tempo_de_empresa: nil, feedback: nil) }
    let!(:employee5) { Employee.create!(nome: 'E', email: 'e@e.com', tempo_de_empresa: '', feedback: 3) }

    subject(:eda) { described_class.call }

    it 'returns a hash with expected keys' do
      expect(eda).to include(:tenure_distribution, :feedback_boxplot, :summary_stats)
    end

    describe 'tenure_distribution' do
      it 'orders "menos de 1 ano" first, then numerics, then outros, then "Não informado"' do
        keys = eda[:tenure_distribution].keys
        expect(keys.first).to eq('menos de 1 ano')
        expect(keys).to include('1', '2', 'Não informado')
      end

      it 'counts employees correctly for each tenure' do
        expect(eda[:tenure_distribution]['menos de 1 ano']).to eq(1)
        expect(eda[:tenure_distribution]['1']).to eq(1)
        expect(eda[:tenure_distribution]['2']).to eq(1)
        expect(eda[:tenure_distribution]['Não informado']).to eq(1)
      end
    end

    describe 'feedback_boxplot' do
      it 'returns [min, q1, median, q3, max] for feedbacks' do
        expect(eda[:feedback_boxplot].size).to eq(5)
        expect(eda[:feedback_boxplot].first).to eq(2)
        expect(eda[:feedback_boxplot].last).to eq(5)
        expect(eda[:feedback_boxplot][2]).to eq(3.5)
      end

      it 'returns [0,0,0,0,0] if no feedbacks' do
        Employee.delete_all
        expect(described_class.call[:feedback_boxplot]).to eq([ 0, 0, 0, 0, 0 ])
      end
    end

    describe 'summary_stats' do
      it 'returns correct average, median, min, max, total' do
        stats = eda[:summary_stats]
        expect(stats['Média Feedback']).to eq(3.5)
        expect(stats['Mediana Feedback']).to eq(3.5)
        expect(stats['Mínimo Feedback']).to eq(2)
        expect(stats['Máximo Feedback']).to eq(5)
        expect(stats['Total Funcionários']).to eq(5)
      end

      it 'returns zeros if no feedbacks' do
        Employee.delete_all
        stats = described_class.call[:summary_stats]
        expect(stats['Média Feedback']).to eq(0)
        expect(stats['Mediana Feedback']).to eq(0)
        expect(stats['Mínimo Feedback']).to eq(0)
        expect(stats['Máximo Feedback']).to eq(0)
        expect(stats['Total Funcionários']).to eq(0)
      end
    end
  end
end
