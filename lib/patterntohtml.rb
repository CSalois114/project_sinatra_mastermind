module PatternToHTML
  def pattern_to_html(pattern)
    pattern.map do |peg_color|
      "<font color='#{peg_color}'>&#11044</font>"
    end.join
  end
end