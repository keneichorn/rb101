def swap_name(name)
  full_name = name.split(' ')
  "#{full_name[1]}, #{full_name[0]}"
end


p swap_name('Joe Roberts') == 'Roberts, Joe'