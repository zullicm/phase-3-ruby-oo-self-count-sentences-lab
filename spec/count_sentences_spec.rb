require 'spec_helper'

describe String, "#count_sentences" do

  it  "returns the number of sentences in a string" do
    expect("one. two. three?".count_sentences).to eq(3)
  end

  it "returns zero if there are no sentences in a string" do
    expect("".count_sentences).to eq(0)
  end
end
