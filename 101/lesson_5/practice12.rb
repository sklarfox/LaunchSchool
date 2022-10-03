arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

final_hash = Hash.new

arr.each do |subarray|
  final_hash[subarray[0]] = subarray[1]
end



p ({:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"} == final_hash)