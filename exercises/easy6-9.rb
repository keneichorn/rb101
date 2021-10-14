def include?(array, search_value)
  answer = array.find(-> {false}) { |ele| ele == search_value }
  answer == search_value
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false