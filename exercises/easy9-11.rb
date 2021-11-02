def anagrams(array_of_words)
  words = array_of_words.map do |word|
    word.chars.sort.join
  end
  words
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p anagrams(words)