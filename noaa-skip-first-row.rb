# seek happens in "constant time", so it's fast
File.open("data/wksst8110.for") do |file|
  file.seek(63)
  file.read(10)
end

# irb(main):003:0> file.seek(63)
# 0
# irb(main):004:0> file.read(10)
# " 10JAN1990"
