array = (01..99).to_a
odds = array.select { |x| x % 2 == 1 }

odds.each { |x| puts x }