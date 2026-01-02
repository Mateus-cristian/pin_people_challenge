# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :nome, presence: true
  validates :email, presence: true
end
