  UPPERCASE = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  array_of_chars = string.chars.map do |char|
    if UPPERCASE.include?(char)
      char.downcase
    elsif LOWERCASE.include?(char)
      char.upcase
    else
      char
    end
  end
  array_of_chars.join
end




p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'