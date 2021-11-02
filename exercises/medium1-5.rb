def first_half(stars)
  stars_array = []
  (1..stars).each do |num|
    if num.odd?
      stars_array << '*' * num
    end
  end
  stars_array
end

def second_half(stars)
  stars_array = []
  start = stars - 1
  start.downto(1) do |num|
    if num.odd?
      stars_array << '*' * num
    end
  end
  stars_array
end

def diamond(stars)
  stars_array = first_half(stars) + second_half(stars)
  stars_array.each do |star|
    puts star.center(stars)
  end

end


diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)