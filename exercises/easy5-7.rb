def word_sizes(string)
  words = string.gsub(/[^a-z ]/i, '').split(' ')
  word_hash = Hash.new(0)

  words.each do |word|
    word_hash[word.size] += 1
  end

  word_hash.sort.to_h
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}