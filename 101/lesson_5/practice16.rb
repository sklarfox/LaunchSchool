HEX = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  10 => 'a',
  11 => 'b',
  12 => 'c',
  13 => 'd',
  14 => 'e',
  15 => 'f'
}

def rand_hex
  HEX[rand(15)]
end

def create_uuid
  uuid = ''
  36.times do
    uuid += rand_hex()
  end
  uuid[8] = '-'
  uuid[13] = '-'
  uuid[18] = '-'
  uuid[23] = '-'

  uuid
end

p create_uuid
p create_uuid
p create_uuid
p create_uuid