def rotate_array(array)
  new_array = array.clone
  first = new_array.shift
  new_array << first
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end



p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

a = 'This is a string'
p rotate_string(a) #== 'his is a stringT'

b = 123456
p rotate_integer(b) == 234561