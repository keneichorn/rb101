def multiply_list(array1, array2)
  array1.zip(array2).map { |ele| ele.inject(:*) }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]