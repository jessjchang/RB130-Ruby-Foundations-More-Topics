require 'minitest/autorun'

class OddTest < MiniTest::Test
  def test_odd?
    value = 5
    assert(value.odd?, "Value is not odd")
  end
end