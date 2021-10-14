def letter_swap(a, b)
  a, b = b, a
  
end

def swap(string)
  string_array = string.split(' ').map do |word|
  letter_swap(word[0], word[-1])
end

  string_array.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'