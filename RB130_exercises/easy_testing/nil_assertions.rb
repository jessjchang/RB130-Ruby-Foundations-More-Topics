require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NilTest < MiniTest::Test
  def setup
    @value = false
  end

  def test_nil
    assert_nil(@value)
  end
end

# Failure Message: Expected false to be nil.