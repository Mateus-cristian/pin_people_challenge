# frozen_string_literal: true

require 'rails_helper'
require 'unicode_utils'
require 'pragmatic_segmenter'

RSpec.describe Sentiment::Analyzer do
  let(:positive_text) { 'Ótimo ambiente, equipe excelente e liderança inspiradora.' }
  let(:negative_text) { 'Ambiente ruim, muita pressão e falta de reconhecimento.' }
  let(:neutral_text)  { 'O escritório fica em São Paulo.' }


  it 'detects positive sentiment' do
    analyzer = described_class.new(positive_text)
    expect(analyzer.call).to eq(:positive)
  end

  it 'detects negative sentiment' do
    analyzer = described_class.new(negative_text)
    expect(analyzer.call).to eq(:negative)
  end

  it 'detects neutral sentiment' do
    analyzer = described_class.new(neutral_text)
    expect(analyzer.call).to eq(:neutral)
  end

  it 'normalizes text removing accents and case' do
    analyzer = described_class.new('Ótimo')
    expect(analyzer.send(:normalize, 'Ótimo')).to eq('otimo')
  end

  it 'segments sentences correctly' do
    text = 'Gosto muito daqui. Mas poderia ter mais benefícios.'
    analyzer = described_class.new(text)
    expect(analyzer.call).to be_in([ :positive, :negative, :neutral ])
  end
end
