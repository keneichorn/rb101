def crunch(string)
  counter = 0
  crunched_string = ''

  until counter == string.size
    unless string[counter] == string[counter + 1]
      crunched_string << string[counter]
    end
    counter += 1
  end
  crunched_string
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''
