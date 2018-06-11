ARGF.each do |line|
  case ARGF.file.lineno
  when 1 then puts "\n#{ARGF.filename}\n\n" # filename header (path)
  when 6 then ARGF.skip; next # puts first five lines, then goto next file
  end
  puts line
end

# % ruby argf-skip2.rb data/wksst8110.for
# 
# data/wksst8110.for
# 
#  03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
#  10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3
#  17JAN1990     24.2-0.3     25.3-0.3     26.5-0.1     28.6 0.3
#  24JAN1990     24.4-0.5     25.5-0.4     26.5-0.1     28.4 0.2
#  31JAN1990     25.1-0.2     25.8-0.2     26.7 0.1     28.4 0.2
