file = File.open("file.txt")
# irb(main):001:0> file = File.open("file.txt")
# #<File:file.txt>
contents = file.read
# irb(main):002:0> contents = file.read
# "Hello World! Time to take text processing to the next level.\n\nAlways learning. Always improving. Always Aaron.\n"
puts contents
# irb(main):003:0> puts contents
# Hello World! Time to take text processing to the next level.
# 
# Always learning. Always improving. Always Aaron.
# nil

# -------
#
# or you can consider using a do block to operate on the variable
File.open("file.txt") do |file|
  contents = file.read
end

# or just use #read, which File inherits from IO
contents = File.read("file.txt")

# use the #readlines method to return an array of file lines
log_file = File.open("access_log")
requests = log_file.readlines

# irb(main):001:0> log_file = File.open("access_log")
# #<File:access_log>
# -rw-r--r--@ 1 aaron  staff  378 Sep 29  2015 access_log
# irb(main):002:0> requests = log_file.readlines
# [
#     [0] "127.0.0.1 - [10/Oct/2014:13:55:36 +0000] \"GET / HTTP/1.1\" 200 561\n",
#     [1] "127.0.0.1 - [10/Oct/2014:13:55:36 +0000] \"GET /images/logo.png HTTP/1.1\" 200 23260\n",
#     [2] "192.168.0.42 - [10/Oct/2014:14:10:21 +0000] \"GET / HTTP/1.1\" 200 561\n",
#     [3] "192.168.0.91 - [10/Oct/2014:14:20:51 +0000] \"GET /person.jpg HTTP/1.1\" 200 46780\n",
#     [4] "192.168.0.42 - [10/Oct/2014:14:20:54 +0000] \"GET /about.html HTTP/1.1\" 200 483\n"
# ]
# // this is similar to log_file.read.split("\n") except that string ending doesnt have \n
#
# ----------------
#
# we can take it furher and operate on each string element of the array
requests.each do |request|
  puts request if request.start_with?("127.0.0.1 ")
end
# 127.0.0.1 - [10/Oct/2014:13:55:36 +0000] "GET / HTTP/1.1" 200 561
# 127.0.0.1 - [10/Oct/2014:13:55:36 +0000] "GET /images/logo.png HTTP/1.1" 200 23260
#
# The downside is that the entire file contents are loaded into memory at once
# using #readlines. The "requests" object is basically populated with everything we
# need to operate on/against it. We can do a little better by using #eachline

log_file = File.open("access_log")
# requests = log_file.readlines
log_file.eachline do |request|
  puts request if request.start_with?("127.0.0.1 ")
end

# -------------

File.foreach("access_log") do |request|
  puts request if request.start_with?("127.0.0.1 ")
end
