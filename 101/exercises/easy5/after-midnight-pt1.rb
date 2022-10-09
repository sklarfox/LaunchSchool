def time_of_day_og(input)
  input > -1 ? input = input % 1440 : input = 1440 - (-input % 1440)
  time = input.divmod(60)
  "%02d:%02d" % time
end

def time_of_day(input)
  t = Time.new(2020,01,01)
end

p time_of_day(0)  == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29