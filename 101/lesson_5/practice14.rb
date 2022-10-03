hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

output = hsh.each_with_object([]) do |(fruit, stats), array|
    array << stats[:colors].map { |color| color.capitalize } if stats[:type] == 'fruit'
    array << stats[:size].upcase if stats[:type] == 'vegetable'
end

p output
p output == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]