require_relative "guess"
require_relative "patterntohtml"

class Mastermind
  attr_reader :key, :guesses, :num_of_turns, :html_key  
  include PatternToHTML

  def initialize(guesses, key)
    @key = key ? key : get_random_key
    @html_key = pattern_to_html(@key.dup)
    @guesses = guesses.map {|guess| Guess.new(@key, guess)}
    @num_of_turns = 12
  end

  def winner?
    @guesses.last && @guesses.last.pattern == @key
  end

  def looser?
     @guesses.length == @num_of_turns && @guesses.last.pattern != @key
  end

  def get_random_key 
    4.times.map do
      ["blue", "green", "red", "yellow", "orange", "purple"].sample
    end
  end
end