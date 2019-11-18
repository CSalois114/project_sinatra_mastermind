class Guess 
  attr_reader :pattern, :comparison
  def initialize(key, pattern)
    @key = key
    @pattern = pattern
    @comparison = compare_to_key()
  end

  private
  
  def compare_to_key
    comparison = []
    key_copy = @key.array.dup
    pattern_copy = @pattern.array.dup
  
    key_copy.length.times do |index|
      if pattern_copy[index] == key_copy[index]
        key_copy[index] = nil
        pattern_copy[index] = nil
        comparison << "<font color='black'>&#11044</font>"
      end
    end
  
    key_copy.length.times do |index|
      if pattern_copy[index] && key_copy.include?(pattern_copy[index])
        key_copy[key_copy.index(pattern_copy[index])] = nil
        comparison << "<font color='white'>&#11044</font>"
      end
    end
    comparison << nil until comparison.length == 4 
    comparison
  end
end