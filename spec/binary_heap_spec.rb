require "spec_helper"

describe DSS::BinaryHeap do

  let(:klass)    { described_class }
  let(:unsorted) { [6, 7, 12, 10, 15, 17, 5] }

  it "arranges the values internally" do
    heap = klass.new(unsorted)
    expect(heap.guts).to eq(
      [nil, 5, 7, 6, 10, 15, 17, 12]
    )
  end

  it "always returns the minimum item" do
    heap = klass.new(unsorted)
    values = 7.times.map { heap.delete_min }
    expect(values).to eq(unsorted.compact.sort)
  end

  it "can be used for heapsort" do
    nums = (1..1_000).to_a.shuffle
    sorted = klass.new(nums).delete_all
    expect(sorted).to eq(nums.sort)
  end

end
