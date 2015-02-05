require "spec_helper"

describe DSS::BinaryHeap do

  let(:unsorted) { [6, 7, 12, 10, 15, 17, 5] }

  it "arranges the values internally" do
    heap = described_class.new(unsorted)
    expect(heap.guts).to eq(
      [nil, 5, 7, 6, 10, 15, 17, 12]
    )
  end

  xit "always returns the minimum item" do
    pending "fix infinite loop!"
    heap = described_class.new(unsorted)
    values = 7.times.map { heap.delete_min }
    expect(values).to eq(unsorted.compact.sort)
  end

end
