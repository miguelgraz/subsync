#!/usr/bin/env ruby
require './subtime.rb'

out_file = File.open('output.srt', 'w')
@fps1 = 23.980 * 1000.0
@fps2 = 23.976 * 1000.0
@time1 = nil
File.open('Rise.of.the.Guardians 23.980 FPS.srt', 'r').each do |line|
  # if line =~ /^[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}\s[-]{2}>\s[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}/
  if line['-->']
    unless @time1.nil?
      @time2 = Subtime.new(line.split(/\s[-]{2}>\s/).first)
      @dif1 = (@time2 - @time1).to_i * 1000.0
      @dif2 = Subtime.new(((@dif1 * (@fps2 / @fps1).round(400)) / 1000.0).round(450))
      result = (@time1 + @dif2)
      out_file.print line.gsub(/^[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}/, result.to_s)
      # @time1 = @time2
    else
      @time1 = Subtime.new(line.split(/\s[-]{2}>\s/).first)
      out_file.print line
    end
  else
    out_file.print line
  end
end
