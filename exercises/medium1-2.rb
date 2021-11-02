def rotate_rightmost_digits(number, size)
  string_array = number.to_s.chars
  rightmost_digits = string_array.slice!(-size..-1)
  (string_array << rotate_array(rightmost_digits)).flatten
  string_array.join.to_i
end

def rotate_array(array)
  new_array = array.clone
  first = new_array.shift
  new_array << first
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917