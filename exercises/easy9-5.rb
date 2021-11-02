LOWERCASE = ('a'..'z').to_a

def uppercase?(string)
  string.chars.all?(/[^a-z]/)
end



p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true