class Pattern
  attr_reader :array, :html
  def initialize(pattern)
    @array = pattern
    @html = pattern_to_html
  end

  private 

  def pattern_to_html
    pattern = @array.dup
    pattern.map do |peg_color|
      "<font color='#{peg_color}'>&#11044</font>"
    end.join
  end
end