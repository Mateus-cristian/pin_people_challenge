# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :survey_responses, class_name: 'EmployeeSurveyResponse', dependent: :destroy

  validates :nome, presence: true
  validates :email, presence: true
end
