require_relative "helper"
require "binary_heap"


describe DataStructureSandbox::MinHeap do

  let(:klass)    { DataStructureSandbox::MinHeap }
  let(:unsorted) { [6, 7, 12, 10, 15, 17, 5] }

  it "arranges the values internally" do
    heap = klass.new(unsorted)
    heap.guts.must_equal(
      [nil, 5, 7, 6, 10, 15, 17, 12]
    )
  end

  it "always returns the minimum item" do
    heap = klass.new(unsorted)
    values = 7.times.map { heap.delete_min }
    values.must_equal(unsorted.compact.sort)
  end

  it "can be used for heapsort" do
    nums = Array.new(1_000) { rand(1...500) }
    sorted = klass.new(nums).delete_all
    sorted.must_equal(nums.sort)
  end

end

describe DataStructureSandbox::MaxHeap do

  let(:klass)    { DataStructureSandbox::MaxHeap }

  it "can be used for a reverse heapsort" do
    nums = Array.new(1_000) { rand(1...500) }
    sorted = klass.new(nums).delete_all
    sorted.must_equal(nums.sort.reverse)
  end

end
