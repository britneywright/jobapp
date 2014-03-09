Range::RANGE_FORMATS.merge!(
  :condensed => Proc.new do |start, stop|
    if (start.year == stop.year) and (start.month == stop.month)
      "#{start.strftime("%B %-d")}-#{stop.strftime("%-d, %Y")}"
    elsif (start.year == stop.year) and (start.month != stop.month)
      "#{start.strftime("%B %-d")} - #{stop.strftime("%B %-d, %Y")}"
    else  
      "#{start.to_date.to_s(:long)} - #{stop.to_date.to_s(:long)}"
    end
  end
)