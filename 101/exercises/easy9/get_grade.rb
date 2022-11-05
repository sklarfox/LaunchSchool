def get_grade(a, b, c)
  avg = (a + b + c) / 3
  if avg >= 90
    'A'
  elsif avg >= 80
    'B'
  elsif avg >= 70
    'C'
  elsif avg >= 60
    'D'
  else
    'F'
  end

end

p get_grade(95, 90, 93) # == "A"
p get_grade(50, 50, 95) # == "D"
