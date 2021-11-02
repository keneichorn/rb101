def leading_substrings(string)
  counter = 0
  array_of_strings = []

  until counter == string.size
    array_of_strings << string[0..counter]
    counter += 1
  end
  array_of_strings
end




p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']