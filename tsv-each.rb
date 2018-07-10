File.open("data/shopping.tsv") do |file|
  file.each_line do |record|
    # I added the Kernel#p method to see the results myself
    p record

    # "White Bread\t£1.20\tBaker\n"
    # "Whole Milk\t£0.80\tCorner Shop\n"
    # "Gorgonzola\t£10.20\tCheese Shop\n"
    # "Mature Cheddar\t£5.20\tCheese Shop\n"
    # "Limburger\t£6.35\tCheese Shop\n"
    # "Newspaper\t£1.20\tCorner Shop\n"
    # "Ilchester\t£3.99\tCheese Shop\n"
  end

  # The default delimiter for #each_line is \n
  # We change it using Ruby's $/ variable (input record separator)
  # Say "dollar slash" out loud; here's my output from Rails console:
  # pry(main)> $/
  # => "\n"
end
