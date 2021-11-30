STRINGS = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}

def integer_to_string(integer)
  strings = integer.digits.reverse
  strings.map! { |num| STRINGS[num]}
  strings.join('')
end

def signed_integer_to_string(integer)
  number = integer_to_string(integer.abs)
  if integer > 0
    '+' + number
  elsif integer == 0
    number
  else
    '-' + number
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
