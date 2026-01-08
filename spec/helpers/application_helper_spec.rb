# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#format_percent' do
    it 'formats percentage values correctly' do
      expect(helper.format_percent(0.1234)).to eq('12,34%')
      expect(helper.format_percent(1)).to eq('100,00%')
      expect(helper.format_percent(nil)).to eq('-')
    end
  end
end
