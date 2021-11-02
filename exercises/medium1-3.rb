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

def max_rotation(integer)
  counter = integer.to_s.size
  until counter == 1
    integer = rotate_rightmost_digits(integer, counter)
    counter -= 1
  end
  integer
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845