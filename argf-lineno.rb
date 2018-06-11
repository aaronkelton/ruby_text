# ARGF.lineno is the running count of all the lines from all the files passed to ARGF ruby file
# compare to previous argf-features.rb, which uses ARGF.file.lineno
ARGF.each do |line|
  puts "#{ARGF.lineno}: #{line}"
end

# % ruby argf-lineno.rb error_log scores.txt 
# 1: [Tue Dec 30 15:25:20 2014] [error] Directory index forbidden
# 2: [Tue Dec 30 15:26:11 2014] [notice] caught SIGTERM, shutting down
# 3: [Tue Dec 30 15:26:14 2014] [notice] Digest: generating secret ...
# 4: [Tue Dec 30 15:26:14 2014] [notice] Digest: done
# 5: [Tue Dec 30 15:26:14 2014] [notice] Apache (Unix) -- resuming normal operations
# 6: Bob 40
# 7: Alice 98
# 8: Gillian 100
# 9: Fred 67
