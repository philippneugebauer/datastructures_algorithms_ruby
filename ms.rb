require 'pry'
class Mb

  def self.b
    m = Mb.new
    m.minimum_bribes([1,2,5,3,7,8,6,4])
  end

  def minimum_bribes(q)
    result = half_array q
    puts "result #{result[0].join(", ")}"
    result[1]
  end

  def half_array(a, count = 0)
    half = a.length / 2

    if half > 0
      left = half_array(a.slice(0, half), 0)
      count += left[1]
      left = left[0]

      right = half_array(a.slice(half, a.length), 0)
      count += right[1]
      right = right[0]

      merge = []

      l_count = 0
      r_count = 0

      length = left.length + right.length

      [*0..length].each do |l|
        if l_count == left.length && r_count < right.length
          merge << right[r_count]
          r_count += 1
        elsif r_count == right.length && l_count < left.length
          merge << left[l_count]
          l_count += 1
        elsif r_count == right.length && l_count == left.length
          break
        elsif left[l_count] > right[r_count]
          merge << right[r_count]
          r_count += 1
          count += 1
        elsif left[l_count] <= right[r_count]
          merge << left[l_count]
          l_count += 1
        end
      end
      return [merge, count]
    end
    return [a, count]
  end

end