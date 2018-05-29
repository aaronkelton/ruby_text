# the first column actually has a leading whitespace character, hence the read(10)
# no headers
File.open("data/wksst8110.for") do |file|
  # " 03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3"
  # get the week
  puts file.read(10)

  # get the four columns of data
  4.times do
    puts file.read(9)
    puts file.read(4)
  end

  # that's a single row
end
