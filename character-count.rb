# IO#each can take an argument. This is not array/enumerable #each
# https://ruby-doc.org/core-2.2.0/IO.html#method-i-each

File.open("commas.txt") do |file|
  file.each(",") do |record|
    puts record
  end
end

# and it works, but I wonder if my `ap` config causes the IO error:
# this is field one,
# this is field two,
# this is field three
# IOError: closed stream
# from /Users/aaron/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/awesome_print-1.8.0/lib/awesome_print/formatters/file_formatter.rb:17:in `directory?'

n = 0
File.open("commas.txt") do |file|
  file.each_char do |char|
    n += 1 if char == 'i'
  end
end
puts "#{n} 'i' characters in comma.txt"
# irb(main):018:0> puts "#{n} 'i' characters in comma.txt"
# 9 'i' characters in comma.txt
# nil

# File.open and subsequent transformation is returned to variable 'n'
n =
  File.open("commas.txt") do |file|
    file.each_char.count {|char| char == 'i'}
  end
puts "#{n} 'i' characters in comma.txt"
# does NOT raise IOError :)
# as the trite saying goes: "It just works."
