arr = [
  {a: [1, 2, 3]}, 
  {b: [2, 4, 6], c: [3, 6], d: [4]}, 
  {e: [8], f: [6, 10]}]

even_hashes = arr.select do |subhash|
  subhash.all? do |key, value|
    value.all? do |integer|
      integer.even?
    end
  end
end
  
p even_hashes


=begin
Outer array
  subhash 1
    k,v
  subhash 2
    k,v
    k,v
    k,v
  subhash 3
    k,v
    k,v
=end