def lights_on(lights)
  lights_hash = {}
  counter = 1
  (1..lights).each { |num| lights_hash[num] = true }
  lights_turned_on = []

  until counter == lights
    counter += 1
    lights_hash.each_pair do |key, value|
      if key % counter == 0
        lights_hash[key] = (value == true) ? false : true
      end
    end
  end
  lights_hash.each_pair { |key, value| lights_turned_on << key if value == true }
  lights_turned_on
end


#p lights_on(5)
p lights_on(1000)