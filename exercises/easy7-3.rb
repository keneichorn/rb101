def word_cap(string)
  words_array = string.split.map { |word| word.capitalize }

  #capitalized_words = words_array.map { |word| word.capitalize }

#capitalized_words.join(' ').gsub("\"", '"')
words_array.join(' ')

end

string = 'four score and seven'

p word_cap(string)
p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
p string