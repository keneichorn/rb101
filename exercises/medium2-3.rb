def percentage(array, length)
 num = (array.size.to_f / length) * 100
 format("%#.1f", num).to_f
end

def letter_percentages(string)
  counts = {}
  lowercase, uppercase, neither = [], [], []
  length = string.size

  string.chars.each do |char|
    if  /[a-z]/.match(char)
      lowercase << char
    elsif /[A-Z]/.match(char)
      uppercase << char
    else
      neither << char
    end
  end

  counts = {
       lowercase: percentage(lowercase, length),
       uppercase: percentage(uppercase, length),
       neither:   percentage(neither, length)
     }
end



p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {lowercase: 66.7, uppercase: 33.3, neither: 0.0}
#further exploration is done