vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  counts = Hash.new(0)
  array.each { |x| p counts[x] += 1 }
end


count_occurrences(vehicles)