module DataStructureSandbox
  # See http://www.cs.cmu.edu/~adamchik/15-121/lectures/Binary%20Heaps/heaps.html

  # TODO - rename to MinHeap, or maybe make MinHeap a subclass which specifies the sorting operators
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

    def delete_min
      min = guts[1]

      sorting_item = guts[1] = guts.pop

      sorting_item_index = 1

      puts guts.inspect
      while any_children?(sorting_item_index)
        smallest_child = smallest_child_of(sorting_item_index)

        # if parent is larger than a child element,
        # swap with that element, then repeat this process at the next level
        puts "sorting item is #{sorting_item.inspect}, sc #{smallest_child.inspect}"
        if sorting_item > smallest_child[0]
          swap_indices(sorting_item_index, smallest_child[1])
          sorting_item_index = smallest_child[1]
        end
      end

      min
    end

    def any_children?(index)
      return true if guts[left_child_index(index)]
      return true if guts[right_child_index(index)]
      false
    end

    def smallest_child_of(index)
      left_child        = [guts[left_child_index(index)], left_child_index(index)]
      right_child       = [guts[right_child_index(index)], right_child_index(index)]
      [left_child, right_child].tap {|things| puts "before select: #{things.inspect}"}.select {
        |val, i| !val.nil?
      }.min_by { |val, i| val }
    end

    def left_child_index(index)
      index * 2
    end

    def right_child_index(index)
      (index * 2) + 1
    end

    private

    def swap_indices(one, other)
      guts[one], guts[other] = [guts[other], guts[one]]
    end

  end

end
