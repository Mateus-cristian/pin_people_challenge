# frozen_string_literal: true

module Reports
  class EmployeeReportService
    def self.call(scope = EmployeeSurveyResponse.all)
      new(scope).call
    end

    def initialize(scope)
      @scope = scope
    end

    def call
      {
        headcount: Employee.count,
        avg_feedback: (@scope.average(:feedback)&.round(2) || 0),
        enps: calculate_enps,
        sentiment: calculate_sentiment
      }
    end

    private

    def calculate_enps
      total = @scope.where.not(enps: nil).count
      return 0 if total == 0
      promoters = @scope.where(enps: 9..10).count
      detractors = @scope.where(enps: 0..6).count
      (((promoters.to_f / total) - (detractors.to_f / total)) * 100).round
    end

    def calculate_sentiment
      comments = @scope.pluck(:comentarios_feedback).compact
      return { positive: 0, negative: 0, neutral: 0 } if comments.empty?
      counts = { positive: 0, negative: 0, neutral: 0 }
      comments.each do |comment|
        result = Sentiment::Analyzer.new(comment).call
        counts[result] += 1
      end
      total = comments.size.to_f
      {
        positive: ((counts[:positive] / total) * 100).round,
        negative: ((counts[:negative] / total) * 100).round,
        neutral: ((counts[:neutral] / total) * 100).round
      }
    end
  end
end
