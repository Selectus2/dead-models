require_relative "classification"

# A deterministic stand-in for the production model.
# It lowercases the ticket and returns the category of
# the first rule whose keyword appears anywhere in it.
# No rule matches: "other". That is the whole model.
class Classifier
  NAME = "ticket-classifier@v2"

  RULES = [
    ["invoice",      "billing"],
    ["refund",       "billing"],
    ["charge",       "billing"],
    ["payment",      "billing"],
    ["subscription", "billing"],
    ["receipt",      "billing"],
    ["down",         "outage"],
    ["error",        "outage"],
    ["500",          "outage"],
    ["timeout",      "outage"],
    ["timing out",   "outage"],
    ["not loading",  "outage"],
    ["crash",        "outage"],
    ["slow",         "outage"],
    ["password",     "access"],
    ["log in",       "access"],
    ["login",        "access"],
    ["locked out",   "access"],
    ["permission",   "access"],
    ["invite",       "access"]
  ].freeze

  def initialize(rules = RULES)
    @rules = rules
  end

  def classify(text)
    ticket = text.downcase
    _, category = @rules.find { |kw, _| ticket.include?(kw) }
    category || "other"
  end

  # Raise. Don't coerce.
  def classify!(text)
    record = Classification.new
    record.category = classify(text)
    record.validate!
    record.category
  end
end
