MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

require 'pry'
require 'pry-byebug'

def time_of_day(input)
  input > -1 ? input = input % 1440 : input = 1440 - (-input % 1440)
  time = input.divmod(60)
  "%02d:%02d" % time
end

def after_midnight(input)
  timecodes = input.split(':').map(&:to_i)
  (timecodes[0] % HOURS_PER_DAY) * MINUTES_PER_HOUR + timecodes[1]
end

def before_midnight(input)
  timecodes = input.split(':').map(&:to_i)
  (MINUTES_PER_DAY - timecodes[0] * MINUTES_PER_HOUR - timecodes[1]) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0