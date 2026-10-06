require "active_model"

class Classification
  include ActiveModel::Validations
  CATEGORIES = %w[billing outage access other]
  attr_accessor :category
  validates :category, inclusion: { in: CATEGORIES }
end
