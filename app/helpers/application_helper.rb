module ApplicationHelper
  def line_length(str)
    lines = str.split(/\n/)
    lines.push('')		# insure at least one zero length line

    sizes = lines.map(&:size)
    sizes.max
  end

  def num_lines(str)
    str.split(/\n/).size
  end
end
