requests =
  File.open("access_log") do |file|
    file
      .map { |line| { ip: line.split(" ").at(0), url: line.split[5] } }
      .group_by { |request| request[:ip] }
      .each { |ip, requests| requests.map! { |r| r[:url] } }
  end

  file = File.open("access_log")
  #line = '127.0.0.1 - [10/Oct/2014:13:55:36 +0000] "GET / HTTP/1.1" 200 561'
  ip_urls = file.map do|line|{ip: line.split(" ").at(0), url: line.split[5]};end
  # returns an array of hashes

  # line.split[0] is really line.split()[0], or line.split(" ").at(0), or even line.split(nil).at(0)
  # RubyDoc: If pattern is omitted, the value of $; is used. If $; is nil (which is the default), str is split on whitespace as if ` ' were specified.

  # irb(main):003:0> file.map do|line|{ip: line.split[0], url: line.split[5]};end
  # [
  #     [0] {
  #          :ip => "127.0.0.1",
  #         :url => "/"
  #     },
  #     [1] {
  #          :ip => "127.0.0.1",
  #         :url => "/images/logo.png"
  #     },
  #     [2] {
  #          :ip => "192.168.0.42",
  #         :url => "/"
  #     },
  #     [3] {
  #          :ip => "192.168.0.91",
  #         :url => "/person.jpg"
  #     },
  #     [4] {
  #          :ip => "192.168.0.42",
  #         :url => "/about.html"
  #     }
  # ]

  requests = ip_urls.group_by{|request|request[:ip]}
  # group_by will return a hash whose keys are unique ip
  # the array associated with each key is the original, so we have duplication on :ip
#   {
#        "127.0.0.1" => [
#         [0] {
#              :ip => "127.0.0.1",
#             :url => "/"
#         },
#         [1] {
#              :ip => "127.0.0.1",
#             :url => "/images/logo.png"
#         }
#     ],
#     "192.168.0.42" => [
#         [0] {
#              :ip => "192.168.0.42",
#             :url => "/"
#         },
#         [1] {
#              :ip => "192.168.0.42",
#             :url => "/about.html"
#         }
#     ],
#     "192.168.0.91" => [
#         [0] {
#              :ip => "192.168.0.91",
#             :url => "/person.jpg"
#         }
#     ]
# }

  requests.each{|ip,requests|requests.map!{|r|r[:url]}}
  # iterate through each ip/request pair, and only return the urls as array elements
  # inner hash transformed to an array of request urls
# {
#      "127.0.0.1" => [
#       [0] "/",
#       [1] "/images/logo.png"
#   ],
#   "192.168.0.42" => [
#       [0] "/",
#       [1] "/about.html"
#   ],
#   "192.168.0.91" => [
#       [0] "/person.jpg"
#     ]
#}
