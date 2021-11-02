def buy_fruit(array)
  fruits = []
  array.each do |list|
    list[1].times do fruits << list[0]
    end
  end
  fruits
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]