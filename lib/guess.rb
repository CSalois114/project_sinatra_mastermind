require_relative "patterntohtml"

class Guess 
  attr_reader :pattern, :comparison, :html
  include PatternToHTML
  def initialize(key, pattern)
    @key = key
    @pattern = pattern
    @html = pattern_to_html(@pattern.dup)
    @comparison = compare_to_key()
  end

  private
  
  def compare_to_key
    comparison = []
    key_copy = @key.dup
    pattern_copy = @pattern.dup
  
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