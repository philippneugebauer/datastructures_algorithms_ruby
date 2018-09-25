class Qs

  def self.q
    q = Qs.new
    result = q.quicksort [6,9,2,3,7,1,4]
    puts "result: [#{result.join(", ")}]"
  end

  def quicksort array, l_count = 0, r_count = array.length - 1
    return array if l_count > r_count

    pivot = array[r_count]
    sort_end = r_count

    while r_count >= l_count

      puts "array #{array.join(", ")}, r_count #{r_count}, l_count #{l_count}, pivot #{pivot}"

      if array[l_count] > pivot && array[r_count] <= pivot
        big = array[l_count]
        small = array[r_count]

        array[l_count] = small
        array[r_count] = big

        r_count -= 1
        l_count += 1
      else
        if array[l_count] <= pivot
          l_count += 1
        end

        if array[r_count] > pivot
          r_count -= 1
        end
      end
    end

    array[array.index(pivot)] = r_count
    array[r_count] = pivot

    quicksort array, 0, array.index(pivot) - 1
    quicksort array, array.index(pivot) + 1, sort_end

    return array
  end
end