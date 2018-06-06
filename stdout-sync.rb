$stdout.sync = true

10.times do
  "hello world".each_char do |c|
    print c
    sleep 0.1
  end
  print "\n"
end

# ruby stdout-sync.rb | cat
# returns the 10 lines of "hello world", but prints one char at a time! Cool!
