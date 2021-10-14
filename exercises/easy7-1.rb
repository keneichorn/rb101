def interleave(array1, array2)
  counter = 0
  new_array = []

  loop do 
    new_array << array1[counter]
    new_array << array2[counter]
    counter += 1
    break if counter == array1.size
  end
  new_array
end



p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


def interleave2(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']