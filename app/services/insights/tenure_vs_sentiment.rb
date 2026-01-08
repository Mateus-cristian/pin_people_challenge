# frozen_string_literal: true

require_relative '../sentiment/analyzer'

module Insights
  class TenureVsSentiment
    def tenure_bucket(value)
      case value.to_s
      when /menos de 1/
        '0-1'
      when /1 a 3/
        '1-3'
      when /3 a 5/
        '3-5'
      else
        '5+'
      end
    end

    def call
      buckets = Hash.new { |h, k| h[k] = [] }
      Employee.find_each do |e|
        bucket = tenure_bucket(e.tempo_de_empresa)
        feedback_comment = e.survey_responses.order(data_da_resposta: :desc).pluck(:comentarios_feedback).compact.first
        sentiment = Sentiment::Analyzer.new(feedback_comment).call
        buckets[bucket] << sentiment
      end
      buckets.transform_values { |sentiments| sentiments.tally }
    end
  end
end
