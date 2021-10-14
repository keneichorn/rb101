def lengths(pun, size=2)
  pun * size
end


def print_in_box(string)
  puts "+#{lengths('-', string.size)}+"
  puts "|#{lengths(' ', string.size)}|"
  puts "|#{string}|"
  puts "|#{lengths(' ', string.size)}|"
  puts "+#{lengths('-', string.size)}+"
end


print_in_box('To boldly go where no one has gone before.')