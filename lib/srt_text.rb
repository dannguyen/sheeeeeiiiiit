def srt_text(srttext)
  data = []
  srttext.split("\n").each do |line|
    case line
    when /^$/
      # blank line, skip
    when /(\d{2}:\d{2}:\d{2},\d{2,3}) --> (\d{2}:\d{2}:\d{2},\d{2,3})/
     data[-1][:start_time], data[-1][:end_time] = $~[1..-1]
    when /^\d+$/
      # segment number
       data << {number: $1, text: ''}
    else
      data[-1][:text] << line
    end
  end

  data
end
