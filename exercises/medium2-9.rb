def bubble_sort!(array)
  size = array.size

  loop do
    array2 = array.clone
    counter = 0
    counter2 = 1

    loop do
      if array[counter] > array[counter2]
        array[counter], array[counter2] = array[counter2], array[counter]
      end

      counter += 1
      counter2 += 1
      break if counter2 == size
    end
    break if array2 == array
  end

  array
end



array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)