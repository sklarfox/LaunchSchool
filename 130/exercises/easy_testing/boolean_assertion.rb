require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  def setup
    @int = 4
  end
  def test_odd?
    assert_equal(true, @int.odd?)
  end

end


value = 4
assert_equal true, value.odd?