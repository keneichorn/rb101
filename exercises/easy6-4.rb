

p list = [1,2,3,4]
result = reverse!(list)
p result #== [4, 3, 2, 1] # true
p list #== [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
reverse!(list) == [] # true
p list == [] # true