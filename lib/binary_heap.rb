module DataStructureSandbox
  # See http://www.cs.cmu.edu/~adamchik/15-121/lectures/Binary%20Heaps/heaps.html

  # TODO - rename to MinHeap
  class BinaryHeap

    attr_accessor :guts

    def initialize(array)
      # Internally, we represent the whole heap structure as an array.
      # Each array slot represents a node.
      # The first slot is nil so that we can start at index 1.
      # For any slot at index k:
      # - The left child node is at index k * 2
      # - The right child node is at index (k * 2) + 1
      # - The parent node is at index k / 2 (discarding decimals)
      self.guts = [nil]
      array.each do |item|
        insert item
      end
    end

    def insert(item)
      guts << item

      # percolate up
      # compare with parent. If parent < item, swap them.
      # repeat
      item_index   = guts.size - 1
      parent_index = item_index / 2

      while !guts[parent_index].nil? && item < guts[parent_index]
        swap_indices(item_index, parent_index)
        item_index   = parent_index
        parent_index = item_index / 2
      end

    end

    def swap_indices(one, other)
      guts[one], guts[other] = [guts[other], guts[one]]
    end

  end

end
