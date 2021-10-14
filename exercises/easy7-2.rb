def letter_case_count(string)
  letter_hash = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |letter|
    if letter.match /[[:upper:]]/
      letter_hash[:uppercase] += 1
    elsif letter.match /[[:lower:]]/
      letter_hash[:lowercase] += 1
    else
      letter_hash[:neither] += 1
    end
  end
  letter_hash
end




p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }