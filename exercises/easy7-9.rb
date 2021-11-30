def multiply_all_pairs(array1, array2)
  combined_arrays = []
  array1.each do |ele|
    array2.each do |second_ele|
      combined_arrays << ele * second_ele
    end
  end
  combined_arrays.sort
end

p multiply_all_pairs([4, 3, 1, 2], [2, 4]) #== [2, 4, 4, 6, 8, 8, 12, 16]