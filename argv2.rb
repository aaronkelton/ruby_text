options = { v: false }

ARGV.delete_if do |arg|
  arg.start_with?("-") &&
    options[arg.sub(/\A-/, "").to_sym] = true
end

ARGF.each do |line|
  puts line
end

# using \A instead of ^ to indicate start of string instead of start of line
