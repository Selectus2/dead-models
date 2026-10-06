RSpec.describe Classifier do
  it "raises on a category it was never told about" do
    model = Classifier.new([["hacked", "security"]])

    expect { model.classify!("We got hacked last night") }
      .to raise_error(ActiveModel::ValidationError)
  end
end
