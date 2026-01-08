# frozen_string_literal: true

module ApplicationHelper
  def format_percent(value)
    return '-' if value.nil?
    formatted = '%.2f' % (value * 100)
    "#{formatted.gsub('.', ',')}%"
  end
end
