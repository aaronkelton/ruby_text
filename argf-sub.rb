# echo "tranquillity" > file.txt
ARGF.each do |line|
  puts line.gsub("tranquillity", "tranquility")
end

# ruby argf-sub.rb file.txt
# => tranquility
#
# ruby -i argf-sub.rb file.txt
# => (no output)
#
# ruby -i'.bak' argf-sub.rb file.txt
# => (still no output, but we have a backup file just in case)
# cat file.txt.bak
# => tranquillity
