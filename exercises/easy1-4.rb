vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(array)
  counts = Hash.new(0)
  array.each { |x| counts[x] += 1 }
  counts.each { |k, v| puts "#{k} => #{v}"}
end


count_occurrences(vehicles)