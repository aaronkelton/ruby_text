# only scores.txt is processed; error_log gets ignored, er um "skipped"
ARGF.each do |line|
  unless ARGF.filename.end_with? ".txt"
    ARGF.skip
    next
  end
  puts line
end

# % ruby argf-skip.rb error_log scores.txt
# Bob 40
# Alice 98
# Gillian 100
# Fred 67
