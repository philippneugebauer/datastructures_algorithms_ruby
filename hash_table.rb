class HashTable

  def initialize(initial_array_length = 16, load_factor_threshold = 2.0/3)
    @array = Array.new initial_array_length, []
    @load_factor_threshold = load_factor_threshold
  end

  def search(value)
    @array[index_of_hashed_value(value)].find {|a| a == value}
  end

  def insert(value)
    rehash_table if adding_value_passes_load_factor_threshold?
    insert_without_rehash_check(value)
  end

  def delete(value)
    @array[index_of_hashed_value(value)].delete value
  end

  # only for debugging
  def get_array
    @array
  end

  private

  def insert_without_rehash_check(value)
    index_of_hashed_value = index_of_hashed_value(value)
    return if @array[index_of_hashed_value].include? value
    @array[index_of_hashed_value] = @array[index_of_hashed_value] + [value]
  end

  def index_of_hashed_value(value)
    value.hash % @array.length
  end

  def rehash_table
    current_power = Math.log2(@array.length)
    old_array = @array

    @array = Array.new Math.ldexp(2, current_power + 1), []
    old_array.flatten.each {|n| insert_without_rehash_check n}
  end

  def adding_value_passes_load_factor_threshold?
    load_factor >= @load_factor_threshold
  end

  def load_factor(for_next_value = true)
    contained_values = @array.sum {|a| a.length}
    contained_values += 1 if for_next_value
    contained_values.to_f/@array.length
  end

end
