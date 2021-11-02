def leading_substrings(string)
  counter = 0
  array_of_strings = []

  until counter == string.size
    array_of_strings << string[0..counter]
    counter += 1
  end
  array_of_strings
end

def substrings(string)
  all_substrings = []
  (0...string.size).each do |index|
    substring = string[index..-1]
    all_substrings.concat(leading_substrings(substring))
  end
  all_substrings
end




 p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]