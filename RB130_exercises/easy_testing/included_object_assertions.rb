require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class IncludeTest < MiniTest::Test
  def setup
    @list = ['abc', 'def']
  end

  def test_includes
    assert_includes(@list, 'xyz')
  end
end

# Failure Message: Expected ["abc", "def"] to include "xyz".
