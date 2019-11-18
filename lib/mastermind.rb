require_relative "guess"
require_relative "pattern"

class Mastermind
  attr_reader :key, :guesses, :num_of_turns

  def initialize(key=get_random_key)
    @key = Pattern.new(key)
    @guesses = []
    @num_of_turns = 15
  end

  def guess(pattern)
    @guesses << Guess.new(@key, Pattern.new(pattern))
  end

  def winner?
    @guesses.last && @guesses.last.pattern.array == @key.array
  end

  def looser?
     @guesses.length == @num_of_turns && @guesses.last.pattern.array != @key.array
  end

  def get_random_key 
    4.times.map do
      ["blue", "green", "red", "yellow", "orange", "purple"].sample
    end
  end
end