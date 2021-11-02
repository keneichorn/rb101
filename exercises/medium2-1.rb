text = File.read("/home/ken/rb101/exercises/pg84.txt")
sentences = text.split(/\.|\?|!/)
longest_sentence = ['']

def sentence_size(sentence)
  sentence.split(' ').size
end

sentences.each do |sentence|
  if sentence_size(sentence) > sentence_size(longest_sentence[0])
    longest_sentence[0] = sentence
  end
end
number_of_words = sentence_size(longest_sentence[0])
longest_sentence[0] = longest_sentence[0].strip

puts "With #{number_of_words} words, the longest sentence is:"
puts "#{longest_sentence[0]}"