require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('text.txt')
    @text = Text.new(@file.read)
  end

  def test_swap
    new_text = @text.swap('a', 'e')
    assert_equal(0, new_text.count('a'))
  end

  def test_word_count
    word_count = @text.word_count
    assert_equal(72, word_count)
  end

  def teardown
    @file.close
  end
end