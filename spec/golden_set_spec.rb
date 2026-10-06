RSpec.describe "golden set" do
  it "holds accuracy across the golden set" do
    hits = GOLDEN.count do |e|
      classify(e.text) == e.label
    end

    expect(hits.fdiv(GOLDEN.size)).to be >= THRESHOLD
  end
end
