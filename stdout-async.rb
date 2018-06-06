10.times do
  "hello world".each_char do |c|
    print c
    sleep 0.1
  end
  print "\n"
end

# run e.g. ruby stdout-async.rb | cat
# I think this will wait 11 seconds, and then splat "hello world" 10 times at once
