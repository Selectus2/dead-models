require_relative "../lib/classifier"
require_relative "support/golden_set"

module GoldenSetHelpers
  def classify(text)
    Classifier.new.classify(text)
  end
end

RSpec.configure do |config|
  config.include GoldenSetHelpers
end
