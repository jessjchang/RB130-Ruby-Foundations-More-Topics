require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EmptyTest < MiniTest::Test
  def setup
    @list = [1, 2, 3]
  end

  def test_empty
    assert_empty(@list)
  end
end

# Failure Message: Expected [1, 2, 3] to be empty.