OR_LETTERS = [['b', 'o'], ['x', 'k'], ['d', 'q'],
              ['c', 'p'], ['n', 'a'], ['g', 't'],
              ['r', 'e'], ['f', 's'], ['j', 'w'],
              ['h', 'u'], ['l', 'y'], ['z', 'm'],
              ['v', 'i']]

def block_word?(word)
  word = word.downcase.chars
  value = []
  OR_LETTERS.each do |letters|
    value << letters if word.include?(letters[0]) && word.include?(letters[1])
  end
  value.empty?
end



p block_word?('BATCH') == true
p block_word?('BUTCH') == false
 p block_word?('jest') == true