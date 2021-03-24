require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def test_kind
    value = Numeric.new
    assert_kind_of(Numeric, value)
  end

  def test_kind2
    value = Integer.new
    assert_kind_of(Numeric, value)
  end

  def test_kind3
    value = 'hello'
    assert_kind_of(Numeric, value)
  end
end

# Third test fails: Expected "hello" to be a kind of Numeric, not String.