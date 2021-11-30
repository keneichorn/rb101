def after_midnight(time)
  minutes = time.split(':')
  minutes = minutes.map(&:to_i)
  minutes[0] = minutes[0] * 60
  
  if minutes.sum == 1440
    0
  else
    minutes.sum
  end
end

def before_midnight(time)
  minutes = time.split(':')
  minutes = minutes.map(&:to_i)
  minutes[0] = minutes[0] * 60

  if minutes.sum == 1440 || minutes.sum == 0
    0
  else
    (minutes.sum - 1440).abs
  end
end


p after_midnight('00:00') #== 0
p before_midnight('00:00')# == 0
p after_midnight('12:34') #== 754
p before_midnight('12:34')# == 686
p after_midnight('24:00') #== 0
p before_midnight('24:00')# == 0