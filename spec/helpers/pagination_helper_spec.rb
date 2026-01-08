# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaginationHelper, type: :helper do
  describe '#pagination_window' do
    it 'returns correct range for middle page' do
      expect(helper.pagination_window(5, 10, 5)).to eq(3..7)
    end

    it 'does not go below first page' do
      expect(helper.pagination_window(1, 10, 5)).to eq(1..5)
    end

    it 'does not go beyond last page' do
      expect(helper.pagination_window(10, 10, 5)).to eq(6..10)
    end

    it 'adjusts range if total less than window' do
      expect(helper.pagination_window(2, 3, 5)).to eq(1..3)
    end
  end
end
