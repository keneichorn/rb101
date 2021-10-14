def triangle(number_of_stars)
  (0..number_of_stars).each do |stars|
    puts "#{' ' * (number_of_stars - stars)}#{ '*' * (stars)}"
  end
end




triangle(5)
triangle(9)