def move(n, from_array, to_array)
  return if n == 0 || from_array.size == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study']
done = ['apply sunscreen', 'go to the beach', 'walk the dog', 'coffee with Tom']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']