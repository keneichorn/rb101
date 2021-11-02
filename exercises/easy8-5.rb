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


def palindromes(string)
  all_palindromes = []
  substrings(string).each do |strings|
    if strings.size > 1
      all_palindromes << strings if strings == strings.reverse
    end
  end
  all_palindromes
end




p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]