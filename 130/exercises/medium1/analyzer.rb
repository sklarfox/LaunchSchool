class TextAnalyzer
  def process
    file = File.open('example.txt')
    text = file.read
    file.close
    yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "Paragraphs: #{text.split("\n\n").size}" }
analyzer.process { |text| puts "Lines: #{text.split("\n").size}" }
analyzer.process { |text| puts "Words: #{text.split.size}" }