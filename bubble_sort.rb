class BubbleSort

  def self.s
    b = BubbleSort.new
    array = [5,8,1,2,4,3]
    puts "array: [#{array.join(", ")}]"
    result = b.bubble_sort array
    puts "array: [#{result.join(", ")}]"
  end

  def bubble_sort(array)
    [*1..array.length - 1].reverse_each do |i|
      swapped = false
      [*0..i - 1].each do |j|
        if array[j] > array[j + 1]
          array[j + 1], array[j] = array[j], array[j + 1]
          swapped = true
        end
      end
      break if swapped == false
    end
    array
  end

end
