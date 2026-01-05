# frozen_string_literal: true

class EmployeeEdaService
  NAO_INFORMADO = 'Não informado'.freeze
  MENOS_DE_UM_ANO = 'menos de 1 ano'.freeze

  def self.call
    new.call
  end

  def call(scope = Employee.joins(:survey_responses))
    {
      tenure_distribution: tenure_distribution(scope),
      feedback_boxplot: feedback_boxplot(scope),
      summary_stats: summary_stats(scope)
    }
  end

  private

  def tenure_distribution(scope)
    raw = scope.group(:tempo_de_empresa).count
    normalized = normalize_keys(raw)
    ordered_distribution(normalized)
  end

  def normalize_keys(hash)
    hash.transform_keys { |k| k.blank? ? NAO_INFORMADO : k }
  end

  def ordered_distribution(distribution)
    keys = distribution.keys

    menos_de_um_ano = keys.find { |k| k.to_s.downcase.strip == MENOS_DE_UM_ANO }
    numeric_keys = keys.select { |k| k.to_s.match?(/^\d+$/) }
    outros = keys - [ menos_de_um_ano, NAO_INFORMADO ] - numeric_keys

    ordered = {}

    ordered[menos_de_um_ano] = distribution[menos_de_um_ano] if menos_de_um_ano
    numeric_keys.sort_by(&:to_i).each { |k| ordered[k] = distribution[k] }
    outros.sort.each { |k| ordered[k] = distribution[k] }
    ordered[NAO_INFORMADO] = distribution[NAO_INFORMADO] if distribution.key?(NAO_INFORMADO)

    ordered
  end

  def feedback_values(scope = Employee.joins(:survey_responses))
    EmployeeSurveyResponse
      .where.not(feedback: nil)
      .where(employee_id: scope.select(:id))
      .order(:feedback)
      .pluck(:feedback)
  end

  def feedback_boxplot(scope)
    values = feedback_values(scope)
    return empty_boxplot if values.empty?

    [
      values.first,
      percentile(0.25, values),
      percentile(0.5, values),
      percentile(0.75, values),
      values.last
    ]
  end

  def percentile(p, values)
    k = (values.size - 1) * p
    f = k.floor
    c = k.ceil

    return values[k] if f == c

    values[f] + (k - f) * (values[c] - values[f])
  end

  def empty_boxplot
    [ 0, 0, 0, 0, 0 ]
  end

  def summary_stats(scope)
    values = feedback_values(scope)
    n = values.size
    {
      'Média Feedback' => n.positive? ? (values.sum.to_f / n).round(2) : 0,
      'Mediana Feedback' => n.positive? ? percentile(0.5, values) : 0,
      'Mínimo Feedback' => values.first || 0,
      'Máximo Feedback' => values.last || 0,
      'Total Funcionários' => Employee.count
    }
  end
end
