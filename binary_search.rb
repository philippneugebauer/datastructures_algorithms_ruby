class BinarySearch

  def self.s
    b = BinarySearch.new
    array = [1,3,5,6,7,8,9]
    puts "array: [#{array.join(", ")}]"
    result = b.binary_search array, 5
    puts "index: #{result}"

    puts "array: [#{array.join(", ")}]"
    result = b.binary_search array, 4
    puts "index: #{result}"
  end

  def binary_search(array, search_element, search_begin = 0, search_end = array.length - 1)
      half = (search_begin + search_end) / 2
      middle_element = array[half]

      puts "half #{half}, search_begin #{search_begin}, search_end #{search_end}, middle_element #{middle_element}"

      if middle_element == search_element
        half
      elsif search_end - search_begin <= 1
        -1
      elsif middle_element > search_element
        binary_search array, search_element, search_begin, half - 1
      elsif middle_element < search_element
        binary_search array, search_element, half + 1, search_end
      end
  end

end
