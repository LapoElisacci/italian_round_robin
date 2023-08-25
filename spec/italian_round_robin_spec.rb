# frozen_string_literal: true

RSpec.describe ItalianRoundRobin do
  it "has a version number" do
    expect(ItalianRoundRobin::VERSION).not_to be nil
  end

  context "when 4 members are passed" do
    let(:members) { [1, 2, 3, 4] }
    let(:expected_result) do
      [
        [[1, 4], [2, 3]],
        [[4, 3], [1, 2]],
        [[2, 4], [3, 1]]
      ]
    end

    it "generates the pairings" do
      result = described_class.generate(members)
      expect(result).to eq(expected_result)
    end
  end

  context "when 8 members are passed" do
    let(:members) { [1, 2, 3, 4, 5, 6, 7, 8] }
    let(:expected_result) do
      [
        [[1, 8], [2, 7], [3, 6], [4, 5]],
        [[8, 5], [6, 4], [7, 3], [1, 2]],
        [[2, 8], [3, 1], [4, 7], [5, 6]],
        [[8, 6], [7, 5], [1, 4], [2, 3]],
        [[3, 8], [4, 2], [5, 1], [6, 7]],
        [[8, 7], [1, 6], [2, 5], [3, 4]],
        [[4, 8], [5, 3], [6, 2], [7, 1]]
      ]
    end

    it "generates the pairings" do
      result = described_class.generate(members)
      expect(result).to eq(expected_result)
    end

  end
end