def joinor(array, delimiter=', ', conjuction='or')
  case array.size
  when 0..2 then array.join(" #{conjuction} ")
  else
    array[-1] = "#{conjuction} #{array.last}"
    array.join(delimiter)
  end
end

p joinor([1])                   # => "1 or 2"
p  joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 3, 3], ', ', 'and')   # => "1, 2, and 3"