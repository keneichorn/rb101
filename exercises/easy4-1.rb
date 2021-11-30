def short_long_short(string1, string2)
  short_string = ''
  long_string = ''
  if string1.length > string2.length
    short_string = string2
    long_string = string1
  else
    short_string = string1
    long_string = string2
  end

  short_string + long_string + short_string

end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"