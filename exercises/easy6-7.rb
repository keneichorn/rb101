def halvsies(array)
  middle = 0

  if array.length.odd?
    middle = array.length / 2
  else
    middle = (array.length / 2) - 1
  end

  [array[0..middle], array[(middle + 1)..-1]]
end




p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]