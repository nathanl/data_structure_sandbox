module DataStructureSandbox
  # See http://www.cs.cmu.edu/~adamchik/15-121/lectures/Binary%20Heaps/heaps.html

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

      item_index   = guts.size - 1
      parent_index = item_index / 2

      while !guts[parent_index].nil? && sorts_higher?(item, guts[parent_index])
        swap_indices(item_index, parent_index)
        item_index   = parent_index
        parent_index = item_index / 2
      end

    end

    def delete_min
      return_val = guts[1]

      case guts.length
      when 1 then return return_val
      when 2
        guts.pop
        return return_val
      else
        sorting_item = guts[1] = guts.pop

        sorting_item_index = 1

        while any_children?(sorting_item_index)
          highest_sorting_child = highest_sorting_child_of(sorting_item_index)

          # if parent is larger than a child element,
          # swap with that element, then repeat this process at the next level
          if sorts_lower?(sorting_item, highest_sorting_child[0])
            swap_indices(sorting_item_index, highest_sorting_child[1])
            sorting_item_index = highest_sorting_child[1]
          else
            break
          end
        end
      end

      return_val
    end

    def delete_all
      acc = []
      until guts[1].nil?
        acc << delete_min
      end
      acc
    end

    private

    def any_children?(index)
      return true if guts[left_child_index(index)]
      return true if guts[right_child_index(index)]
      false
    end

    def highest_sorting_child_of(index)
      left_child        = [guts[left_child_index(index)], left_child_index(index)]
      right_child       = [guts[right_child_index(index)], right_child_index(index)]
      [left_child, right_child].select {
        |val, i| !val.nil?
      }.public_send(highest_sorting_child_method) { |val, i| val }
    end

    def left_child_index(index)
      index * 2
    end

    def right_child_index(index)
      (index * 2) + 1
    end

    def swap_indices(one, other)
      guts[one], guts[other] = [guts[other], guts[one]]
    end

    def sorts_higher?(val, other_val)
      raise NotImplementedError
    end

    def sorts_lower?(val, other_val)
      raise NotImplementedError
    end

    def highest_sorting_child_method
      raise NotImplementedError
    end

  end

  class MinHeap < BinaryHeap

    def sorts_higher?(val, other_val)
      val < other_val
    end

    def sorts_lower?(val, other_val)
      val > other_val
    end

    def highest_sorting_child_method
      :min_by
    end

  end

  class MaxHeap < BinaryHeap

    def sorts_higher?(val, other_val)
      val > other_val
    end

    def sorts_lower?(val, other_val)
      val < other_val
    end

    def highest_sorting_child_method
      :max_by
    end

  end

end
