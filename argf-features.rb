ARGF.each do |line|
  # "-" means we're processing STDIN, and not a file
  # when line number equals 1, we know we're at the start of a new file
  if ARGF.filename != "-" && ARGF.file.lineno == 1
    puts "\n#{ARGF.filename} (#{ARGF.file.size} bytes):\n\n"
  end
  puts line
end

# ruby argf-features.rb error_log scores.txt
# 
# error_log (322 bytes):
# 
# [Tue Dec 30 15:25:20 2014] [error] Directory index forbidden
# [Tue Dec 30 15:26:11 2014] [notice] caught SIGTERM, shutting down
# [Tue Dec 30 15:26:14 2014] [notice] Digest: generating secret ...
# [Tue Dec 30 15:26:14 2014] [notice] Digest: done
# [Tue Dec 30 15:26:14 2014] [notice] Apache (Unix) -- resuming normal operations
# 
# scores.txt (36 bytes):
# 
# Bob 40
# Alice 98
# Gillian 100
# Fred 67
