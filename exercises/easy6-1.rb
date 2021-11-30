DEGREE = "\xC2\xB0"

def dms(angle)
  degree = angle.floor
  minute = (((angle % 1)) * 60).round(2)
  second = (((minute % 1)) * 60).round(2)

  format(%(#{degree}#{DEGREE}%02d'%02d"), minute, second)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
