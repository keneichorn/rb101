def lengths(pun, size)
  if size == 0
    pun * 2
  else
   (pun * size) + (pun * 2)
 end
end

def print_in_box(string)
  puts "+#{lengths('-', string.size)}+"
  puts "|#{lengths(' ', string.size)}|"
  puts "| #{string} |"
  puts "|#{lengths(' ', string.size)}|"
  puts "+#{lengths('-', string.size)}+"
end

print_in_box('')


