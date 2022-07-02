class SelectionSort

  def self.s
    b = SelectionSort.new
    array = [5,8,1,2,4,3]
    puts "array: [#{array.join(", ")}]"
    result = b.selection_sort array
    puts "array: [#{result.join(", ")}]"
  end

  def selection_sort(array)
    array_length = array.length - 1
    [*0..array_length].each do |i|
      min_index = i
      min = array[i]
      [*i+1..array_length].each do |j|
        min_index, min = j, array[j] if min > array[j]
      end
      array[min_index], array[i] = array[i], array[min_index]
    end
    array
  end

  def ruby_selection_sort(array)
    array_length = array.length - 1
    [*0..array_length].each do |i|
      a = array.slice i, array_length
      min_index = a.index a.min
      array[i + min_index], array[i] = array[i], array[i + min_index]
    end
    array
  end

end
