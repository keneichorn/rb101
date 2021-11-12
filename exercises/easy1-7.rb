def stringy(integer, start=1)
  array = (1..integer).to_a
  new_array = array.each_with_index.map do |ind, ele|
          if ind.odd? 
            start
          else
            if start == 1
              0
            elsif start == 0
              1
            end
          end
        end
  new_array.join
end


puts stringy(6) == '101010'
puts stringy(9, 0) #== '101010101'
puts stringy(4, 1) == '1010'
puts stringy(7, 1) == '1010101'